//
//  AuthenticationViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 9/5/22.
//

import Firebase
import GoogleSignIn
import RxRelay
import RxSwift

class AuthenticationViewModel: BaseViewModel {
    private let disposeBag = DisposeBag()
    var state: BehaviorRelay<SignInState> = BehaviorRelay(value: .loading)
    
    enum SignInState {
        case loading
        case signedIn
        case signedOut
    }
    
    override init() {
        super.init()
        configureSignals()
        configureGoogleSignInClientID()
    }
}
extension AuthenticationViewModel {
    private func configureSignals() {
        state
            .asObservable()
            .subscribe { _ in
                self.appCoordinator?.userManager.clearData()
                guard let user = Auth.auth().currentUser else { return }
                let newUser = User(id: user.uid,
                                   displayName: user.displayName,
                                   email: user.email,
                                   photoURL: user.photoURL)
                self.appCoordinator?.userManager.setData(newUser)
                Task {
                    if let preference = await self.appCoordinator?.dataProvider.fetchUserPreference(for: user.uid) {
                        self.appCoordinator?.userManager.setPreference(preference)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
    private func configureGoogleSignInClientID() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            state.accept(.signedOut)
            return
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            self.state.accept(.signedOut)
            return
        }
        guard let _ = user else {
            self.state.accept(.signedOut)
            return
        }
        self.state.accept(.signedIn)
    }
    func signIn() {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            guard
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let rootViewController = windowScene.windows.first?.rootViewController else {
                self.state.accept(.signedOut)
                return
            }
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] signInResult, error in
                self?.authenticateUser(for: signInResult?.user, with: error)
            }
        }
    }
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            state.accept(.signedOut)
        } catch {
            print(error.localizedDescription)
            state.accept(.signedOut)
        }
    }
}

