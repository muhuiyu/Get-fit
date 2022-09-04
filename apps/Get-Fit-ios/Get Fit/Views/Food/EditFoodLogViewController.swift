//
//  EditFoodLogViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit
import RxSwift

class EditFoodLogViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    var viewModel = FoodLogViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - View Config
extension EditFoodLogViewController {
    private func configureViews() {
        
    }
    private func configureConstraints() {
        
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

