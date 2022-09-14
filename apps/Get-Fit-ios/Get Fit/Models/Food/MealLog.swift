//
//  MealLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import FirebaseFirestoreSwift

struct MealLog {
    let hour: Int
    let minute: Int
    var foodLogs: [FoodLog]
    var note: String = ""
}
extension MealLog {
    var totalCalories: Int { foodLogs.map { $0.calories }.reduce(0, +) }
    var totalCarbs: Double { foodLogs.map { $0.carbs }.reduce(0, +) }
    var totalProtein: Double { foodLogs.map { $0.protein }.reduce(0, +) }
    var totalFat: Double { foodLogs.map { $0.fat }.reduce(0, +) }
    var macroRatio: MacroRatio {
        guard !foodLogs.isEmpty else { return MacroRatio(carbs: 0, protein: 0, fat: 0) }
        let caloriesFromCarbs = totalCarbs * 4
        let caloriesFromProtein = totalProtein * 4
        let caloriesFromFat = totalFat * 9
        let totalCalories = caloriesFromCarbs + caloriesFromProtein + caloriesFromFat
        
        if totalCalories == 0 {
            return MacroRatio(carbs: 0, protein: 0, fat: 0)
        } else {
            return MacroRatio(carbs: Double(caloriesFromCarbs) / Double(totalCalories),
                              protein: Double(caloriesFromProtein) / Double(totalCalories),
                              fat: Double(caloriesFromFat) / Double(totalCalories))
        }
    }
    var macroStringInGram: String {
        guard !foodLogs.isEmpty else { return "" }
        return "P: \(String(Int(totalProtein))) g, F: \(String(Int(totalFat)))g, C: \(String(Int(totalCarbs))) g"
    }
}
extension MealLog: Codable {
    
}
