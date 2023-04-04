//
//  AppCoordinator.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit
import RxSwift

// class AppCoordinator: Coordinator {
class AppCoordinator {
    private let disposeBag = DisposeBag()
    private let window: UIWindow
    
    var childCoordinators = [BaseCoordinator]()
    private(set) var mainTabBarController: MainTabBarController?
    
    let dataProvider: RealmDatabase
    private(set) var userManager = UserManager()
    private(set) var cacheManager = CacheManager()
    
    private let authViewModel = AuthenticationViewModel()
    
    private var homeCoordinator: HomeCoordinator?
    private var workoutCoordinator: WorkoutCoordinator?
    private var progressCoordinator: ProgressCoordinator?
    private var meCoordinator: MeCoordinator?

    init?(window: UIWindow?, dataProvider: RealmDatabase?) {
        guard let window = window, let dataProvider = dataProvider else { return nil }
        self.window = window
        self.dataProvider = dataProvider
    }

    func start() {
        configureAuthViewModel()
        configureCoordinators()
        setupMainTabBar()
        configureDatabase()
        window.makeKeyAndVisible()
        authViewModel.signIn()
    }
}
// MARK: - Services and managers
extension AppCoordinator {
    private func configureDatabase() {
        dataProvider.setup()
    }
    private func configureAuthViewModel() {
        authViewModel.appCoordinator = self
        authViewModel.state
            .asObservable()
            .subscribe(onNext: { state in
                switch state {
                case .loading:
                    self.showLoadingScreen()
                case .signedIn:
                    self.showHome()
                case .signedOut:
                    self.showLogin()
                }
            })
            .disposed(by: disposeBag)
        authViewModel.signIn()
    }
}
// MARK: - UI Setup
extension AppCoordinator {
    /// Initializes coordinators
    /// Tab coordinators have their own different navigationControllers
    private func configureCoordinators() {
        let homeNavigationController = UINavigationController(tintColor: UIColor.Brand.primary)
        homeNavigationController.navigationItem.largeTitleDisplayMode = .always
        homeNavigationController.navigationBar.prefersLargeTitles = true
        self.homeCoordinator = HomeCoordinator(navigationController: homeNavigationController,
                                               parentCoordinator: self)
        
        let workoutNavigationController = UINavigationController(tintColor: UIColor.Brand.primary)
        workoutNavigationController.navigationItem.largeTitleDisplayMode = .always
        workoutNavigationController.navigationBar.prefersLargeTitles = true
        self.workoutCoordinator = WorkoutCoordinator(navigationController: workoutNavigationController,
                                                     parentCoordinator: self)
        
        let progressNavigationController = UINavigationController(tintColor: UIColor.Brand.primary)
        progressNavigationController.navigationItem.largeTitleDisplayMode = .always
        progressNavigationController.navigationBar.prefersLargeTitles = true
        self.progressCoordinator = ProgressCoordinator(navigationController: progressNavigationController,
                                                       parentCoordinator: self)
        
        let meNavigationController = UINavigationController(tintColor: UIColor.Brand.primary)
        meNavigationController.navigationItem.largeTitleDisplayMode = .always
        meNavigationController.navigationBar.prefersLargeTitles = true
        self.meCoordinator = MeCoordinator(navigationController: meNavigationController,
                                           parentCoordinator: self)
    }
    private func setupMainTabBar() {
        mainTabBarController = MainTabBarController()
        configureMainTabBar()
    }
    private func configureMainTabBar() {
        mainTabBarController?.appCoordinator = self
        mainTabBarController?.homeCoordinator = homeCoordinator
        mainTabBarController?.workoutCoordinator = workoutCoordinator
        mainTabBarController?.progressCoordinator = progressCoordinator
        mainTabBarController?.meCoordinator = meCoordinator
        mainTabBarController?.configureTabBarItems()
    }
}

// MARK: - Generic Navigation
extension AppCoordinator {
    enum Destination {
        case home
        case loadingScreen
        case login
    }
    private func changeRootViewController(to viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        window.rootViewController = viewController
    }
}

// MARK: - Navigation
extension AppCoordinator {
    func showHome(forceReplace: Bool = true, animated: Bool = true) {
        changeRootViewController(to: self.mainTabBarController)
    }
    func showLoadingScreen(forceReplace: Bool = false, animated: Bool = true) {
        let viewController = LoadingScreenViewController()
        viewController.appCoordinator = self
        changeRootViewController(to: viewController)
    }
    func showLogin(forceReplace: Bool = false, animated: Bool = true) {
        let viewController = WelcomeViewController(appCoordinator: self)
        changeRootViewController(to: viewController)
    }
    func requestLogin() {
        authViewModel.signIn()
    }
}

// MARK: - Users
extension AppCoordinator {
    var isUserLoggedIn: Bool { userManager != nil }
}
