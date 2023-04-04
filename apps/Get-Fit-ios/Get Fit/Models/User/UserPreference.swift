//
//  UserPreference.swift
//  Get Fit
//
//  Created by Mu Yu on 9/6/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserPreference: Codable {
    let userID: UserID
    let goal: UserGoal
    let preferredWorkoutLength: TimeInterval
    let preferredNumberOfMeals: Int
}
extension UserPreference {
    init(snapshot: DocumentSnapshot) throws {
        self = try snapshot.data(as: UserPreference.self)
    }
}
// MARK: - Persistable
extension UserPreference: Persistable {
    public init(managedObject: UserPreferenceObject) {
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
        return UserPreferenceObject(userID: userID, goal: goal.managedObject(), preferredWorkoutLength: preferredWorkoutLength, preferredNumberOfMeals: preferredNumberOfMeals)
    }
}
