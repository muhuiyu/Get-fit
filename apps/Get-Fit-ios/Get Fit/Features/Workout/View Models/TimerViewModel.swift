//
//  TimerViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 3/23/23.
//

import UIKit
import RxSwift
import RxRelay

class TimerViewModel: BaseViewModel {
    var timeLeft: BehaviorRelay<TimeInterval> = BehaviorRelay(value: TimeInterval(90))
    
}

extension TimerViewModel {
    
}

