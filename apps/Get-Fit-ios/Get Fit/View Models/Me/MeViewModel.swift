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

class MeViewModel {
    private let disposeBag = DisposeBag()

    init() {

    }
}

extension MeViewModel {
    var displayTitle: String { AppText.MainTab.me }
    var displayRefreshControlString: String { AppText.General.pullToRefresh }
    var userEmail: String? {
        return UserManager.shared.getUserEmail
    }
}

// MARK: - Delegate
extension MeViewModel {
    @objc
    func didTapOnNotification() {
        
    }
}
