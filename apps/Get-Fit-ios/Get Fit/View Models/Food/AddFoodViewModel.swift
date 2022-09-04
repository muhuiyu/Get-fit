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
    var displayFoods: BehaviorRelay<[FoodLog]> = BehaviorRelay(value: [])
    var date: Date = Date()
    var mealIndex: Int = 0
    
    override init() {
        super.init()
        Task {
            await fetchLoggedFood()
        }
    }
}

extension AddFoodViewModel {
    private func fetchLoggedFood() async {
        guard
            let userID = appCoordinator?.userManager?.id,
            let loggedFoods = await appCoordinator?.dataProvider.fetchLoggedFood(for: userID) else { return }
        
        self.displayFoods.accept(Array(loggedFoods.values))
    }
    func searchFoods(contain keyword: String) {
        let foodIDs = getFoodIDs(contain: keyword)
        let foodLogs: [FoodLog] = foodIDs.compactMap { Food.getFood(for: $0)?.getDefaultFoodLog() }
        self.displayFoods.accept(foodLogs)
    }
    private func getFoodIDs(contain keyword: String) -> [FoodID] {
        // TODO: - Connect to database
//        guard let foodIDs = appCoordinator?.dataProvider.searchFoods(contain: keyword) else { return [] }
        return Food.searchFoods(contain: keyword)
    }
}

extension AddFoodViewModel {
    private func configureCells(with foodIDs: [FoodID]) {
        
    }
    private func configureCellsWithLoggedFoods() {
        
    }
}
