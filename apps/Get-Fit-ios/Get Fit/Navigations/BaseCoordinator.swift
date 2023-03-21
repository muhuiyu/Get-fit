//
//  BaseCoordinator.swift
//  The Mai's
//
//  Created by Mu Yu on 7/27/22.
//

import UIKit

class BaseCoordinator: Coordinator {
    // private or not?
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController,
         parentCoordinator: AppCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        
    }
    
}
// MARK: - Navigation
extension BaseCoordinator {
    /// To navigate to ViewController
    internal func navigate(to viewController: UIViewController,
                           presentModally: Bool,
                           _ detents: [UISheetPresentationController.Detent] = [],
                           options: ModalOptions? = nil) {
        if presentModally {
            if let options = options {
                viewController.modalPresentationStyle = options.modalPresentationStyle
                viewController.isModalInPresentation = options.isModalInPresentation
                if options.isEmbedInNavigationController {
                    present(viewController.embedInNavgationController(), detents)
                } else {
                    present(viewController, detents)
                }
            } else {
                present(viewController, detents)
            }
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    private func present(_ viewController: UIViewController,
                         _ detents: [UISheetPresentationController.Detent] = []) {
        let presentedViewController = navigationController.presentedViewController ?? navigationController
        if !detents.isEmpty, let sheet = viewController.sheetPresentationController {
            viewController.modalPresentationStyle = .pageSheet
            sheet.detents = [.medium()]
        } else {
            viewController.modalPresentationStyle = .automatic
        }
        presentedViewController.present(viewController, animated: true)
    }
}

// MARK: - Dismiss
extension BaseCoordinator {
    func dismissCurrentModal() {
        if let presentedViewController = navigationController.presentedViewController {
            presentedViewController.dismiss(animated: true)
        } else {
            navigationController.popViewController(animated: true)
        }
    }
}

// MARK: - Alert
struct AlertControllerOption {
    let title: String?
    let message: String?
    let preferredStyle: UIAlertController.Style
}
struct AlertActionOption {
    let title: String?
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
    
    static var cancel: AlertActionOption {
        AlertActionOption(title: AppText.General.cancel, style: .cancel, handler: nil)
    }
}

extension BaseCoordinator {
    func presentAlert(option: AlertControllerOption, actions: [AlertActionOption], completion: (() -> Void)? = nil) {
        let alert = configureAlertController(option: option, actions: actions)
        self.present(alert)
    }
    private func configureAlertController(option: AlertControllerOption,
                                          actions: [AlertActionOption]) -> UIAlertController {
        
        let alert = UIAlertController(title: option.title,
                                      message: option.message,
                                      preferredStyle: option.preferredStyle)
        actions.forEach {
            alert.addAction(UIAlertAction(title: $0.title,
                                          style: $0.style,
                                          handler: $0.handler))
        }
        return alert
    }
}

// MARK: - Modals
struct ModalOptions {
    let isEmbedInNavigationController: Bool
    let modalPresentationStyle: UIModalPresentationStyle
    let isModalInPresentation: Bool
    
    init(isEmbedInNavigationController: Bool = false,
         modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
         isModalInPresentation: Bool = false) {
        self.isEmbedInNavigationController = isEmbedInNavigationController
        self.modalPresentationStyle = modalPresentationStyle
        self.isModalInPresentation = isModalInPresentation
    }
}
