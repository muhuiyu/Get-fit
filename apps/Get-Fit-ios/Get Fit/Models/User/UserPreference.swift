//
//  UserPreference.swift
//  Get Fit
//
//  Created by Mu Yu on 9/6/22.
//

import Foundation

struct UserPreference: Codable {
    var id: UUID = UUID()
    let userID: UserID
    let goal: UserGoal
    let preferredWorkoutLength: TimeInterval
    let preferredNumberOfMeals: Int
}
// MARK: - Persistable
extension UserPreference: Persistable {
    public init(managedObject: UserPreferenceObject) {
        id = managedObject.id
        userID = managedObject.userID
        if let goal = managedObject.goal {
            self.goal = UserGoal(managedObject: goal)
        } else {
            self.goal = UserGoal()
        }
        preferredWorkoutLength = managedObject.preferredWorkoutLength
        preferredNumberOfMeals = managedObject.preferredNumberOfMeals
    }
    public func managedObject() -> UserPreferenceObject {
        return UserPreferenceObject(id: id, userID: userID, goal: goal.managedObject(), preferredWorkoutLength: preferredWorkoutLength, preferredNumberOfMeals: preferredNumberOfMeals)
    }
}
