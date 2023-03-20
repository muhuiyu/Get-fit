//
//  ProgressViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import UIKit
import RxSwift

class ProgressViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    var viewModel = ProgressViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        
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

