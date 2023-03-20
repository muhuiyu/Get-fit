//
//  AddFoodViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit
import RxSwift
import RxRelay

class AddFoodViewModel: BaseViewModel {
    private var previousFoodLogs = [FoodLog]()
    var displayFoods: BehaviorRelay<[FoodLog]> = BehaviorRelay(value: [])
    var date: Date = Date()
    var mealIndex: Int = 0
}

// MARK: - Functions
extension AddFoodViewModel {
    func setup() async {
        await fetchLoggedFood()
        displayFoods.accept(previousFoodLogs)
    }
    /// Returns food items from database
    func globalSearchFoods(contain keyword: String) async {
        if keyword.isEmpty {
            displayFoods.accept(previousFoodLogs)
            return
        }
        if let foodIDs = appCoordinator?.dataProvider.searchFoods(contain: keyword) {
            let result: [FoodLog] = foodIDs.compactMap { Food.getFood(for: $0)?.getDefaultFoodLog() }
            displayFoods.accept(result)
        }
    }
    /// Quick add food log
    func quickAddFoodLog(_ log: FoodLog) {
        print("quick add \(log.foodID)")
        // show toast "added"
    }
}

// MARK: - Private Methods
extension AddFoodViewModel {
    private func fetchLoggedFood() async {
        guard
            let userID = appCoordinator?.userManager.id,
            let data = await appCoordinator?.dataProvider.fetchPreviousFoodLogs(for: userID) else {
            return
        }
        previousFoodLogs = Array(data.values)
    }
}

extension AddFoodViewModel {
    private func configureCells(with foodIDs: [FoodID]) {
        
    }
    private func configureCellsWithLoggedFoods() {
        
    }
}
