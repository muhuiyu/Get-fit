//
//  MeViewModel.swift
//  Why am I so poor
//
//  Created by Mu Yu on 8/3/22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class MeViewModel: BaseViewModel {
    private let disposeBag = DisposeBag()
}

extension MeViewModel {
    var displayTitle: String { AppText.MainTab.me }
    var displayRefreshControlString: String { AppText.General.pullToRefresh }
    var userEmail: String? {
        return appCoordinator?.userManager?.email
    }
}

// MARK: - Delegate
extension MeViewModel {
    @objc
    func didTapOnNotification() {
        
    }
}
