//
//  UserPreferenceObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/29/23.
//

import Foundation
import RealmSwift

final class UserPreferenceObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var userID: UserID = UserID()
    @objc dynamic var goal: UserGoalObject?
    @objc dynamic var preferredWorkoutLength: TimeInterval = TimeInterval(60)
    @objc dynamic var preferredNumberOfMeals: Int = 3

    convenience init(id: UUID, userID: UserID, goal: UserGoalObject, preferredWorkoutLength: TimeInterval, preferredNumberOfMeals: Int) {
        self.init()
        self.id = id
        self.userID = userID
        self.goal = goal
        self.preferredWorkoutLength = preferredWorkoutLength
        self.preferredNumberOfMeals = preferredNumberOfMeals
    }
}
