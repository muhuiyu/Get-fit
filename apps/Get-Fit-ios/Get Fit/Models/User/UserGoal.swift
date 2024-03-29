//
//  UserGoal.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import Foundation

struct UserGoal: Codable {
    var id: UUID = UUID()
    var weightGoal: UserWeightGoal?
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

// MARK: - Persistable
extension UserGoal: Persistable {
    public init(managedObject: UserGoalObject) {
        id = managedObject.id
        dailyDietaryCalories = managedObject.dailyDietaryCalories
        if let macroRatio = managedObject.macroRatio {
            self.macroRatio = MacroRatio(managedObject: macroRatio)
        } else {
            self.macroRatio = MacroRatio()
        }
        exerciseMinute = managedObject.exerciseMinute
        activeCalories = managedObject.activeCalories
        stepCountGoal = managedObject.stepCountGoal
        sleepHoursGoal = managedObject.sleepHoursGoal
        waterIntakeGoal = managedObject.waterIntakeGoal
    }
    public func managedObject() -> UserGoalObject {
        return UserGoalObject(id: id, dailyDietaryCalories: dailyDietaryCalories, macroRatio: macroRatio.managedObject(), exerciseMinute: exerciseMinute, activeCalories: activeCalories, stepCountGoal: stepCountGoal, sleepHoursGoal: sleepHoursGoal, waterIntakeGoal: waterIntakeGoal)
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
