//
//  MeCoordinator.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class MeCoordinator: BaseCoordinator {
    enum Destination {
        case accountDetails
        case goals
        case reminders
        case appAndDevicesCell
        case editExercises
        case editMeals
        case editRecipes
        case sendFeedback
        case helpAndSupport
    }
}
// MARK: - ViewController List
extension MeCoordinator {
    private func makeViewController(to destination: Destination) -> ViewController? {
        switch destination {
        case .accountDetails:
            let viewController = MeAccountDetailViewController(appCoordinator: parentCoordinator,
                                                               coordinator: self,
                                                               viewModel: MeAccountViewModel())
            return viewController
        case .goals:
            let viewController = MeGoalViewController(appCoordinator: parentCoordinator,
                                                      coordinator: self,
                                                      viewModel: MeGoalViewModel())
            return viewController
        case .reminders:
            // TODO: -
            return BaseViewController()
        case .appAndDevicesCell:
            // TODO: -
            return BaseViewController()
        case .editExercises:
            // TODO: -
            return BaseViewController()
        case .editMeals:
            // TODO: -
            return BaseViewController()
        case .editRecipes:
            // TODO: -
            return BaseViewController()
        case .sendFeedback:
            // TODO: -
            return BaseViewController()
        case .helpAndSupport:
            // TODO: -
            return BaseViewController()
        }
    }
}

// MARK: - Navigation
extension MeCoordinator {
    func showAccountDetails() {
        guard let viewController = makeViewController(to: .accountDetails) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showGoals() {
        guard let viewController = makeViewController(to: .goals) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showReminders() {
        guard let viewController = makeViewController(to: .reminders) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showAppAndDevices() {
        guard let viewController = makeViewController(to: .appAndDevicesCell) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showEditExercises() {
        guard let viewController = makeViewController(to: .editExercises) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showEditMeals() {
        guard let viewController = makeViewController(to: .editMeals) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showEditRecipes() {
        guard let viewController = makeViewController(to: .editRecipes) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showSendFeedback() {
        guard let viewController = makeViewController(to: .sendFeedback) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showHelpAndSupport() {
        guard let viewController = makeViewController(to: .helpAndSupport) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
}
