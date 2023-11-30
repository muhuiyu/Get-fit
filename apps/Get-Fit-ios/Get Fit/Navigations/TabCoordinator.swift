//
//  TabCoordinator.swift
//  Get Fit
//
//  Created by Grace, Mu-Hui Yu on 11/11/23.
//

import UIKit
import Combine

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    func selectTab(_ tab: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentTab() -> TabBarPage?
}

class TabCoordinator: NSObject, TabCoordinatorProtocol {
    
    var type: CoordinatorType = .tab
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var childCoordinators: [Coordinator] = []
    
    private let userService: UserService
    private let workoutService: WorkoutService
    private let foodService: FoodService
    
    required init(_ navigationController: UINavigationController, userService: UserService) {
        self.navigationController = navigationController
        self.userService = userService
        self.tabBarController = .init()
    }
    
    func start() {
        configureTabBarController()
    }
    
    func selectTab(_ tab: TabBarPage) {
        // TODO: -
    }
    
    func setSelectedIndex(_ index: Int) {
        // TODO: -
    }
    
    func currentTab() -> TabBarPage? {
        // TODO: -
        return nil
    }
    
}

extension TabCoordinator {
    private func configureTabBarController() {
        let pages: [TabBarPage] = TabBarPage.allCases
        tabBarController.viewControllers = pages.map { makeViewController(for: $0) }
        tabBarController.delegate = self
        tabBarController.selectedIndex = TabBarPage.food.order
        tabBarController.tabBar.backgroundColor = .systemBackground
        navigationController.viewControllers = [ tabBarController ]
    }
    
    private func makeViewController(for tab: TabBarPage) -> UIViewController {
        
        switch tab {
        case .food:
            let viewController = ViewController()
            viewController.view.backgroundColor = .blue
            viewController.tabBarItem = tab.tabBarItem
            return viewController
        case .workout:
            let viewController = ViewController()
            viewController.view.backgroundColor = .yellow
            viewController.tabBarItem = tab.tabBarItem
            return viewController
        case .progress:
            return UIViewController()
        case .me:
//            let navigationController = UINavigationController()
//            let coordinator = MeCoordinator(navigationController,
//                                            userService: userService,
//                                            tripService: tripService,
//                                            placeService: placeService,
//                                            tabBarItem: tab.tabBarItem)
//            coordinator.finishDelegate = self
//            showCoordinator(coordinator)
//            return navigationController
            let viewController = ViewController()
            viewController.view.backgroundColor = .green
            viewController.tabBarItem = tab.tabBarItem
            return viewController
        }
    }
}

extension TabCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        // todo
    }
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // TODO: -
    }
}

enum TabBarPage: Int, CaseIterable {
    case food = 0
    case workout
    case progress
    case me
    
    var order: Int {
        return rawValue
    }
    
    var title: String {
        switch self {
        case .food: return AppText.MainTab.home
        case .workout: return AppText.MainTab.workout
        case .progress: return AppText.MainTab.progress
        case .me: return AppText.MainTab.me
        }
    }
    
    var image: UIImage? {
        switch self {
        case .food: return UIImage(systemName: Icons.note)
        case .workout: return UIImage(systemName: Icons.flame)
        case .progress: return UIImage(systemName: Icons.chartBar)
        case .me: return UIImage(systemName: Icons.person)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .food: return UIImage(systemName: Icons.noteText)
        case .workout: return UIImage(systemName: Icons.flameFill)
        case .progress: return UIImage(systemName: Icons.chartBarFill)
        case .me: return UIImage(systemName: Icons.personFill)
        }
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: self.title, image: self.image, selectedImage: self.selectedImage)
    }
}
