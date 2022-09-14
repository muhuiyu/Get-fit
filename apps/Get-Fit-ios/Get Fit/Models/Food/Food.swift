//
//  Food.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import Foundation

typealias FoodID = String

struct Food {
    let id: FoodID
    let name: String
    let unitNutritions: [UnitNutrition]
    let note: String = ""
}

extension Food {
    static func getNutritionFacts(for foodID: FoodID,
                                  amount: Double,
                                  unit: FoodUnit) -> NutritionFacts? {
        guard
            let food = getFood(for: foodID),
            let nutrition = food.getUnitNutrition(of: unit) else { return nil }
        
        return nutrition.nutritionFacts.multiply(by: amount / nutrition.amount)
        
    }
    static func getFood(for id: FoodID) -> Food? {
        return all[id]
    }
    static func getItemIDs(contain keyword: String) -> [FoodID] {
        return all.values.filter { $0.name.lowercased().contains(keyword.lowercased()) }.map { $0.id }
    }
}
extension Food {
    static func getItem(of id: FoodID) -> Food? {
        return all[id]
    }
    static func getItemName(of id: FoodID, isLocalized: Bool = false) -> String? {
        // TODO: - Add localized
        return all[id]?.name
    }
    static func getAllItemNames(isLocalized: Bool = false) -> [String] {
        // TODO: - Add localized
        return all.map { $0.value.name }
    }
    static func getAllItemIDs() -> [FoodID] {
        return Array(all.keys)
    }
}
extension Food {
    private func getUnitNutrition(of unit: FoodUnit) -> UnitNutrition? {
        for unitNutrition in unitNutritions {
            if unitNutrition.unit == unit { return unitNutrition }
        }
        return nil
    }
    func getDefaultFoodLog() -> FoodLog? {
        guard let defaultNutrition = unitNutritions.first else { return nil }
        return FoodLog(foodID: self.id, amount: defaultNutrition.amount, unit: defaultNutrition.unit)
    }
}
