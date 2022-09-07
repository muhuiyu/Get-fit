//
//  FoodLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

import Foundation

struct FoodLog {
    let foodID: FoodID
    let amount: Double
    let unit: FoodUnit
}

extension FoodLog {
    var nutrition: NutritionFacts? {
        return Food.getNutritionFacts(for: foodID, amount: amount, unit: unit)
    }
    var calories: Int { nutrition?.calories ?? 0 }
    var carbs: Double { nutrition?.carbs ?? 0 }
    var protein: Double { nutrition?.protein ?? 0 }
    var fat: Double { nutrition?.fat ?? 0 }
}

extension FoodLog: Codable {
    
}
