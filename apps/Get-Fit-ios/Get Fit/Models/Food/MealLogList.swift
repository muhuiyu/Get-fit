//
//  MealLogList.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

typealias MealLogList = [MealLog]

extension MealLogList {
    var totalCalories: Int {
        return self.map { $0.totalCalories }.reduce(0, +)
    }
    var macroRatio: MacroRatio {
        guard !self.isEmpty else { return MacroRatio(carbs: 0, protein: 0, fat: 0) }
        let caloriesFromCarbs = self.map { $0.totalCarbs }.reduce(0, +) * 4
        let caloriesFromProtein = self.map { $0.totalProtein }.reduce(0, +) * 4
        let caloriesFromFat = self.map { $0.totalFat }.reduce(0, +) * 9
        let totalCalories = caloriesFromCarbs + caloriesFromProtein + caloriesFromFat
        
        if totalCalories == 0 {
            return MacroRatio(carbs: 0, protein: 0, fat: 0)
        } else {
            return MacroRatio(carbs: Double(caloriesFromCarbs) / Double(totalCalories),
                              protein: Double(caloriesFromProtein) / Double(totalCalories),
                              fat: Double(caloriesFromFat) / Double(totalCalories))
        }
    }
}
