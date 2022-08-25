//
//  MainTabBarController.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    weak var appCoordinator: AppCoordinator?
    weak var homeCoordinator: HomeCoordinator?
    weak var workoutCoordinator: WorkoutCoordinator?
    weak var meCoordinator: MeCoordinator?
    
    deinit {
        // TODO: - remove notification center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.Brand.primary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - View Configs
extension MainTabBarController {
    func configureTabBarItems() {
        configureInitialTabBarItems()
    }
    
    private func configureInitialTabBarItems() {
        var mainViewControllers = [UINavigationController]()
        TabBarCategory.allCases.forEach { [weak self] category in
            guard let _ = self else { return }
            if let viewController = generateViewController(category) {
                mainViewControllers.append(viewController)
            }
        }
        self.viewControllers = mainViewControllers
    }
    
    private func generateViewController(_ category: TabBarCategory) -> UINavigationController? {
        let viewController = category.viewController
        viewController.appCoordinator = self.appCoordinator
        viewController.homeCoordinator = self.homeCoordinator
        viewController.workoutCoordinator = self.workoutCoordinator
        viewController.meCoordinator = self.meCoordinator
        viewController.tabBarItem = category.tabBarItem
        
        switch category {
        case .home:
            self.homeCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.homeCoordinator?.navigationController
        case .workout:
            self.workoutCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.workoutCoordinator?.navigationController
        case .me:
            self.meCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.meCoordinator?.navigationController
        }
    }
}

enum TabBarCategory: Int, CaseIterable {
    case home = 0
    case workout = 1
    case me = 2
    
    var title: String {
        switch self {
        case .home: return AppText.MainTab.home
        case .workout: return AppText.MainTab.workout
        case .me: return AppText.MainTab.me
        }
    }
    var inactiveImageValue: UIImage? {
        switch self {
        case .home: return UIImage(systemName: Icons.dollarsignCircle)
        case .workout: return UIImage(systemName: Icons.flame)
        case .me: return UIImage(systemName: Icons.person)
        }
    }
    var activeImageValue: UIImage? {
        switch self {
        case .home: return UIImage(systemName: Icons.dollarsignCircleFill)
        case .workout: return UIImage(systemName: Icons.flameFill)
        case .me: return UIImage(systemName: Icons.personFill)
        }
    }
    var viewController: BaseViewController {
        switch self {
        case .home: return HomeViewController()
        case .workout: return WorkoutViewController()
        case .me: return MeViewController()
        }
    }
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: self.title, image: self.inactiveImageValue, tag: self.rawValue)
        item.selectedImage = self.activeImageValue
        return item
    }
}
