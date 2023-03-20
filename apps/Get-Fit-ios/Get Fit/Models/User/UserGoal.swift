//
//  UserGoal.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserGoal: Codable {
    var dailyDietaryCalories: Int
    var macroRatio: MacroRatio
    var exerciseMinute: Int
    var activeCalories: Int
    var stepCountGoal: Int
    var sleepHoursGoal: Double
    var waterIntakeGoal: Double
    
    init(dailyDietaryCalories: Int = 1300,
         macroRatio: MacroRatio = MacroRatio(carbs: 0.4, protein: 0.3, fat: 0.3),
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
        return Double(dailyDietaryCalories) * macroRatio.carbs / 4
    }
    var proteinGramGoal: Double {
        return Double(dailyDietaryCalories) * macroRatio.protein / 4
    }
    var fatGramGoal: Double {
        return Double(dailyDietaryCalories) * macroRatio.fat / 9
    }
}
