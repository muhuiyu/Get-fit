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
    var state: BehaviorRelay<SignInState> = BehaviorRelay(value: .signedOut)
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    override init() {
        super.init()
        self.state
            .asObservable()
            .subscribe { _ in
                if let user = Auth.auth().currentUser {
                    let newUser = User(id: user.uid,
                                       displayName: user.displayName,
                                       email: user.email,
                                       photoURL: user.photoURL)
                    
                    self.appCoordinator?.userManager.clearData()
                    self.appCoordinator?.userManager.setData(newUser)
                } else {
                    
                }
            }
            .disposed(by: disposeBag)
    }
}
extension AuthenticationViewModel {
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            self.state.accept(.signedOut)
            return
        }
        guard let authentication = user?.authentication, let idToken = authentication.idToken else {
            self.state.accept(.signedOut)
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            if let error = error {
                print(error.localizedDescription)
                self.state.accept(.signedOut)
            }
            self.state.accept(.signedIn)
        }
    }
    func signIn() {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                self.state.accept(.signedOut)
                return
            }
            
            let configuration = GIDConfiguration(clientID: clientID)
            guard
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let rootViewController = windowScene.windows.first?.rootViewController else {
                self.state.accept(.signedOut)
                return
            }
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
                authenticateUser(for: user, with: error)
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
            self.state.accept(.signedOut)
        }
    }
}

