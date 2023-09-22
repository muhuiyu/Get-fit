//
//  BaseViewModel.swift
//  Fastiee
//
//  Created by Mu Yu on 6/27/22.
//

import Foundation
import RxSwift

protocol ViewModelType {
    
}

class BaseViewModel: ViewModelType {
    internal let disposeBag = DisposeBag()
    
    weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator? = nil) {
        self.appCoordinator = appCoordinator
    }
}
