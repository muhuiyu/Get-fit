//
//  TimerController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/23/23.
//

import UIKit
import RxSwift

// TODO: -
class TimerViewController: BaseMVVMViewController<TimerViewModel> {
    
    private let closeButton = IconButton(name: Icons.xmark)
    private let timeLabel = UILabel()
    private let controlButton = IconButton(name: Icons.playFill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}

// MARK: - View Config
extension TimerViewController {
    private func configureViews() {
        
    }
    private func configureConstraints() {
        
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
//        viewModel.timeLeft
//            .asObservable()
//            .subscribe { value in
//                <#code#>
//            }
//            .disposed(by: disposeBag)
    }
}
