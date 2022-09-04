//
//  UserGoal.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

struct UserGoal {
    var dailyDietaryCalories: Int
    var macroRatio: [MacroItem: Double]
    var exerciseMinute: Int
    var activeCalories: Int
    var stepCountGoal: Int
    var sleepHoursGoal: Double
    var waterIntakeGoal: Double
    
    init(dailyDietaryCalories: Int = 1300,
         macroRatio: [MacroItem: Double] = [ .carbs: 0.4, .protein: 0.3, .fat: 0.3 ],
         exerciseMinute: Int = 30,
         activeCalories: Int = 200,
         stepCountGoal: Int = 10000,
         sleepHoursGoal: Double = 8,
         waterIntakeGoal: Double = 2) {
        
        self.dailyDietaryCalories = dailyDietaryCalories
        self.macroRatio = macroRatio
        self.exerciseMinute = exerciseMinute
        self.activeCalories = activeCalories
        self.stepCountGoal = stepCountGoal
        self.sleepHoursGoal = sleepHoursGoal
        self.waterIntakeGoal = waterIntakeGoal
    }
}

extension UserGoal {
    var carbsGramGoal: Double {
        guard let ratio = macroRatio[.carbs] else { return 0 }
        return Double(dailyDietaryCalories) * ratio / 4
    }
    var proteinGramGoal: Double {
        guard let ratio = macroRatio[.protein] else { return 0 }
        return Double(dailyDietaryCalories) * ratio / 4
    }
    var fatGramGoal: Double {
        guard let ratio = macroRatio[.fat] else { return 0 }
        return Double(dailyDietaryCalories) * ratio / 9
    }
}
