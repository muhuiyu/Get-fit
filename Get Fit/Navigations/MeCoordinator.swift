//
//  MeCoordinator.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class MeCoordinator: BaseCoordinator {
    enum Destination {
        case viewAccountDetails
        case viewGoals
    }
}
// MARK: - ViewController List
extension MeCoordinator {
    private func makeViewController(for destination: Destination) -> ViewController? {
        switch destination {
        case .viewAccountDetails:
            let viewController = MeAccountDetailViewController()
            viewController.meCoordinator = self
            return viewController
        case .viewGoals:
            // TODO: -
            return BaseViewController()
        }
    }
}

// MARK: - Navigation
extension MeCoordinator {
    func showAccountDetails() {
        guard let viewController = makeViewController(for: .viewAccountDetails) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showGoals() {
        guard let viewController = makeViewController(for: .viewGoals) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
}
