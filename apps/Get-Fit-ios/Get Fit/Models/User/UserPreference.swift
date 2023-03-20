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
