//
//  FoodLogViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import UIKit
import RxSwift
import RxRelay

class FoodLogViewModel: BaseViewModel {
    private let disposeBag = DisposeBag()
    
    var foodLog: BehaviorRelay<FoodLog?> = BehaviorRelay(value: nil)
    var date: Date?
    var mealIndex: Int = 0
    var foodLogIndex: Int = 0
    
    override init() {
        super.init()
        configureSignals()
    }
}

extension FoodLogViewModel {
    private func configureSignals() {
        foodLog
            .asObservable()
            .subscribe {
                // TODO: -
            }
            .disposed(by: disposeBag)
    }
}

