//
//  MeAccountViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 4/7/23.
//

import UIKit
import RxSwift

class MeAccountViewModel: BaseViewModel {
    
}

extension MeAccountViewModel {
    var lastSyncText: String {
        guard let dataProvider = appCoordinator?.dataProvider else { return "" }
        return "Last sync: " + dataProvider.lastSyncTime.formatted()
    }
    func syncBackup() {
        appCoordinator?.dataProvider.syncBackup()
    }
    func signout() {
        
    }
}
