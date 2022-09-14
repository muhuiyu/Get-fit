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
    private let disposeBag = DisposeBag()
    private var previousFoodLogs = [FoodLog]()
    var displayFoods: BehaviorRelay<[FoodLog]> = BehaviorRelay(value: [])
    var date: Date = Date()
    var mealIndex: Int = 0
}

extension AddFoodViewModel {
    func setup() async {
        await fetchLoggedFood()
        displayFoods.accept(previousFoodLogs)
    }
    private func fetchLoggedFood() async {
        guard
            let userID = appCoordinator?.userManager.id,
            let data = await appCoordinator?.dataProvider.fetchPreviousFoodLogs(for: userID) else {
            return
        }
        self.previousFoodLogs = Array(data.values)
    }
    /// Filters previous foodLogs
    func filterOptions(for searchText: String) {
        let filteredOptions = previousFoodLogs.filter({ log in
            guard let name = Food.getItemName(of: log.foodID) else { return false }
            return name.lowercased().contains(searchText.lowercased())
        })
        displayFoods.accept(filteredOptions)
    }
    /// Returns food items from database
    func globalSearchFoods(contain keyword: String) async {
        if let foodIDs = await appCoordinator?.dataProvider.searchFoods(contain: keyword) {
            let foodLogs: [FoodLog] = foodIDs.compactMap { Food.getFood(for: $0)?.getDefaultFoodLog() }
            self.displayFoods.accept(foodLogs)
        }
    }
    func selectFoodLog(_ log: FoodLog) {
        print("select \(log.foodID)")
        // show toast
    }
    func quickAddFoodLog(_ log: FoodLog) {
        print("quick add \(log.foodID)")
        // show toast "added"
    }
}

extension AddFoodViewModel {
    private func configureCells(with foodIDs: [FoodID]) {
        
    }
    private func configureCellsWithLoggedFoods() {
        
    }
}
