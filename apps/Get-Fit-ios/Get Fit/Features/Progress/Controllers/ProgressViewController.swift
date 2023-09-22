//
//  ProgressViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import UIKit
import RxSwift

class ProgressViewController: BaseMVVMViewController<ProgressViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        
        // fetch data
    }
}
// MARK: - View Config
extension ProgressViewController {
    private func configureViews() {
        title = AppText.MainTab.progress
    }
    private func configureConstraints() {
        
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

