//
//  AddFoodViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit
import RxSwift

class AddFoodViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    var viewModel = AddFoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - View Config
extension AddFoodViewController {
    private func configureViews() {
        title = AppText.Home.addFoodLog.capitalizeWithAPStyle()
    }
    private func configureConstraints() {
        
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

