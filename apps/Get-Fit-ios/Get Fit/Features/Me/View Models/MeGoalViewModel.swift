//
//  MeGoalViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 4/7/23.
//

import Foundation
import RxSwift
import RxRelay

class MeGoalViewModel: BaseViewModel {
    var userGoal: BehaviorRelay<UserGoal?> = BehaviorRelay(value: nil)
}

extension MeGoalViewModel {
    var startingWeight: Double {
        // TODO: -
        return 50.0
    }
    var currentWeight: Double {
        // TODO: -
        return 45.0
    }
    var goalWeight: Double {
        // TODO: -
        return 40.5
    }
}
