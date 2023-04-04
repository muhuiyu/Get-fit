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
    var displayName: String?
    var email: String?
    var photoURL: URL?
    
    // MARK: - Fetch separately
    var goal: UserGoal = UserGoal()
    var preferredWorkoutLength: TimeInterval = 60
    var preferredNumberOfMeals: Int = 3
    var biologicalSex: HKBiologicalSex = .notSet        // Health data
    var loggedFoods: [FoodID: AmountAndUnit] = [:]      // Food
    var workoutSessions: [WorkoutSession] = []          // Workout sessions
    
    init(id: UserID,
         displayName: String?,
         email: String? = nil,
         photoURL: URL? = nil) {
            
        self.id = id
        self.displayName = displayName
        self.email = email
        self.photoURL = photoURL
    }
}
extension User {
    init() {
        self.id = ""
        self.displayName = nil
        self.email = nil
        self.photoURL = nil
    }
}
// MARK: - Persistable
extension User: Persistable {
    public init(managedObject: UserObject) {
        id = managedObject.id
        displayName = managedObject.displayName
        email = managedObject.email
        photoURL = URL(string: managedObject.photoURLString ?? "")
    }
    
    public func managedObject() -> UserObject {
        return UserObject(id: id, displayName: displayName, email: email, photoURLString: photoURL?.absoluteString)
    }
}
extension User {
    enum Attribute {
        case id
        case displayName
        case email
        case photoURL
        case goal
        case preferredWorkoutLength
        case preferredNumberOfMeals
    }
}
extension User {
    mutating func clearData() {
        self.id = ""
        self.displayName = nil
        self.email = nil
        self.photoURL = nil
        self.goal = UserGoal()
        self.preferredWorkoutLength = 60
        self.preferredNumberOfMeals = 3
        self.biologicalSex = .notSet
        self.loggedFoods.removeAll()
        self.workoutSessions.removeAll()
    }
}
