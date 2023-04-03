//
//  UserGoalObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/29/23.
//

import Foundation
import RealmSwift

final class UserGoalObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var dailyDietaryCalories: Int = 0
    @objc dynamic var macroRatio: MacroRatioObject?
    @objc dynamic var exerciseMinute: Int = 0
    @objc dynamic var activeCalories: Int = 0
    @objc dynamic var stepCountGoal: Int = 0
    @objc dynamic var sleepHoursGoal: Double = 0
    @objc dynamic var waterIntakeGoal: Double = 0
    
    convenience init(dailyDietaryCalories: Int, macroRatio: MacroRatioObject, exerciseMinute: Int, activeCalories: Int, stepCountGoal: Int, sleepHoursGoal: Double, waterIntakeGoal: Double) {
        self.init()
        self.dailyDietaryCalories = dailyDietaryCalories
        self.macroRatio = macroRatio
        self.exerciseMinute = exerciseMinute
        self.activeCalories = activeCalories
        self.stepCountGoal = stepCountGoal
        self.sleepHoursGoal = sleepHoursGoal
        self.waterIntakeGoal = waterIntakeGoal
    }
}
