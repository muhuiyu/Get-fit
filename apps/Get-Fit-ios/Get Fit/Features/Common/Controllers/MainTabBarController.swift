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
    weak var progressCoordinator: ProgressCoordinator?
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
        viewController.tabBarItem = category.tabBarItem
        
        switch category {
        case .home:
            viewController.coordinator = homeCoordinator
            self.homeCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.homeCoordinator?.navigationController
        case .workout:
            viewController.coordinator = workoutCoordinator
            self.workoutCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.workoutCoordinator?.navigationController
        case .progress:
            viewController.coordinator = progressCoordinator
            self.progressCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.progressCoordinator?.navigationController
        case .me:
            viewController.coordinator = meCoordinator
            self.meCoordinator?.navigationController.setViewControllers([viewController], animated: true)
            return self.meCoordinator?.navigationController
        }
    }
}

enum TabBarCategory: Int, CaseIterable {
    case home = 0
    case workout = 1
    case progress = 2
    case me = 3
    
    var title: String {
        switch self {
        case .home: return AppText.MainTab.home
        case .workout: return AppText.MainTab.workout
        case .progress: return AppText.MainTab.progress
        case .me: return AppText.MainTab.me
        }
    }
    var inactiveImageValue: UIImage? {
        switch self {
        case .home: return UIImage(systemName: Icons.note)
        case .workout: return UIImage(systemName: Icons.flame)
        case .progress: return UIImage(systemName: Icons.chartBar)
        case .me: return UIImage(systemName: Icons.person)
        }
    }
    var activeImageValue: UIImage? {
        switch self {
        case .home: return UIImage(systemName: Icons.noteText)
        case .workout: return UIImage(systemName: Icons.flameFill)
        case .progress: return UIImage(systemName: Icons.chartBarFill)
        case .me: return UIImage(systemName: Icons.personFill)
        }
    }
    var viewController: BaseViewController {
        switch self {
        case .home: return HomeViewController(viewModel: HomeViewModel())
        case .workout: return WorkoutViewController(viewModel: WorkoutViewModel())
        case .progress: return ProgressViewController()
        case .me: return MeViewController()
        }
    }
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: self.title, image: self.inactiveImageValue, tag: self.rawValue)
        item.selectedImage = self.activeImageValue
        return item
    }
}
