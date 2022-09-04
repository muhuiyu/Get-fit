//
//  AppCoordinator.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

// class AppCoordinator: Coordinator {
class AppCoordinator {
    private let window: UIWindow
    
    var childCoordinators = [BaseCoordinator]()
    private(set) var mainTabBarController: MainTabBarController?
    private(set) var loadingScreenController: LoadingScreenViewController?
    
    let dataProvider: DataProvider = Database()
    private(set) var userManager: UserManager?
    private(set) var cacheManager = CacheManager()
    
    private var homeCoordinator: HomeCoordinator?
    private var workoutCoordinator: WorkoutCoordinator?
    private var progressCoordinator: ProgressCoordinator?
    private var meCoordinator: MeCoordinator?

    init?(window: UIWindow?) {
        guard let window = window else { return nil }
        self.window = window
    }

    func start() {
        Task {
            await configureManagers()
            await window.makeKeyAndVisible()
        }
        configureLoadingScreen()
        configureCoordinators()
        setupMainTabBar()
        changeRootViewController(to: self.loadingScreenController)
    }
}
// MARK: - Services and managers
extension AppCoordinator {
    private func configureManagers() async {
        await dataProvider.setup()
        if let user = await dataProvider.fetchCurrentUser() {
            userManager = UserManager(user: user)
        }
        // TODO: - connect collections to data provider
    }
}
// MARK: - UI Setup
extension AppCoordinator {
    /// Sets loading screen as rootViewController and embeds in a navigationController
    private func configureLoadingScreen() {
        let viewController = LoadingScreenViewController()
        viewController.appCoordinator = self
        self.loadingScreenController = viewController
    }
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
        changeRootViewController(to: self.loadingScreenController)
    }
    func showLogin(forceReplace: Bool = false, animated: Bool = true) {
        // TODO: -
    }
}

// MARK: - Users
extension AppCoordinator {
    var isUserLoggedIn: Bool { userManager != nil }
}
