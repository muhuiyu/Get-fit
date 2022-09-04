//
//  User.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

import Foundation
import HealthKit

typealias UserID = String

struct User {
    var id: UserID
    var name: String
    var email: String
    var profileImageURLString: String?
    var goal: UserGoal
    
    // MARK: - Fetch separately
    var biologicalSex: HKBiologicalSex = .notSet        // Health data
    var loggedFoods: [FoodID: AmountAndUnit] = [:]      // Food
    var workoutSessions: [WorkoutSession] = []          // Workout sessions
    
    init(id: UserID,
         name: String,
         email: String,
         profileImageURLString: String? = nil,
         goal: UserGoal) {
            
        self.id = id
        self.name = name
        self.email = email
        self.profileImageURLString = profileImageURLString
        self.goal = goal
    }
}
extension User {
    static let testUser: User = User(id: "mikan123",
                                     name: "Mikan",
                                     email: "mikan@kankan.com",
                                     goal: UserGoal(dailyDietaryCalories: 1000,
                                                    macroRatio: [ .carbs: 0, .protein: 0.35, .fat: 0.65 ],
                                                    exerciseMinute: 120,
                                                    activeCalories: 900,
                                                    stepCountGoal: 40000,
                                                    sleepHoursGoal: 7,
                                                    waterIntakeGoal: 3))
}
