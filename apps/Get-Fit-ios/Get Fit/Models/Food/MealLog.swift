//
//  MealLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

typealias MealLogID = String

struct MealLog {
    let id: MealLogID
    let date: DateTriple
    let foodLogs: [FoodLog]
    let note: String = ""
}
extension MealLog {
    var totalCalories: Int { foodLogs.map { $0.calories }.reduce(0, +) }
    var totalCarbs: Double { foodLogs.map { $0.carbs }.reduce(0, +) }
    var totalProtein: Double { foodLogs.map { $0.protein }.reduce(0, +) }
    var totalFat: Double { foodLogs.map { $0.fat }.reduce(0, +) }
    var macroRatios: [MacroItem: Double] {
        guard !foodLogs.isEmpty else { return [:] }
        let caloriesFromCarbs = totalCarbs * 4
        let caloriesFromProtein = totalProtein * 4
        let caloriesFromFat = totalFat * 9
        let totalCalories = caloriesFromCarbs + caloriesFromProtein + caloriesFromFat
        return [
            .carbs: Double(caloriesFromCarbs) / Double(totalCalories),
            .protein: Double(caloriesFromProtein) / Double(totalCalories),
            .fat: Double(caloriesFromFat) / Double(totalCalories)
        ]
    }
}
