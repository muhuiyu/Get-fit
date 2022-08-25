//
//  HomeViewModel.swift
//  Why am I so poor
//
//  Created by Mu Yu on 6/25/22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class HomeViewModel {
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactive Properties
    var displayCells: BehaviorRelay<[[UITableViewCell]]> = BehaviorRelay(value: [])

    init() {
        configureSignals()
    }
}

// MARK: - Interface
extension HomeViewModel {
    func reloadDailyLog(shouldPull: Bool,
                        completion: (() -> Void)?) {
        
        configureCells()
        
        if let completion = completion {
            return completion()
        }
    }
}
// MARK: - AppText
extension HomeViewModel {
    var displayTitle: String { AppText.MainTab.home }
    var displayRefreshControlString: String { AppText.General.pullToRefresh }
}
// MARK: - Configuration
extension HomeViewModel {
    private func configureCells() {
        var cells = [[UITableViewCell]]()
        
        // 1. Macro summary
        let summaryCell = CaloriesSummaryCell()
        cells.append([summaryCell])

        // 2. Movement, sleep and water intake
        let movementCell = DailyMovementCell()
        let sleepCell = UITableViewCell()
        let waterIntakeCell = UITableViewCell()
        cells.append([
            movementCell, sleepCell, waterIntakeCell
        ])
        
        // 3. Others...?
        displayCells.accept(cells)
    }
    private func configureSignals() {
        
    }
}
