//
//  Meal.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

struct Meal {
    let date: DateTriple
    let foodLogs: [FoodLog]
    let note: String = ""
}
extension Meal {
    var totalCalories: Int {
        // TODO: -
        return 689
    }
}

struct FoodLog {
    let foodID: FoodID
    let amount: Double
    let unit: FoodUnit
}
