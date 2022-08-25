//
//  AppCoordinator.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    var childCoordinators = [BaseCoordinator]()
//    private(set) var navigationController: UINavigationController?
    private(set) var mainTabBarController: MainTabBarController?
    private(set) var loadingScreenController: LoadingScreenViewController?
    
    // TODO: - Add some managers here (userSessionManager, cacheManager)
//    private var userManager = UserManager.shared
    private var homeCoordinator: HomeCoordinator?
    private var workoutCoordinator: WorkoutCoordinator?
    private var meCoordinator: MeCoordinator?

    init?(window: UIWindow?) {
        guard let window = window else { return nil }
        self.window = window
    }

    func start() {
        configureLoadingScreen()
        configureCoordinators()
        setupMainTabBar()
        changeRootViewController(to: self.loadingScreenController)
        window.makeKeyAndVisible()
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
