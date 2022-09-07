//
//  UserPreference.swift
//  Get Fit
//
//  Created by Mu Yu on 9/6/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserPreference {
    let userID: UserID
    let goal: UserGoal
    let preferredWorkoutLength: TimeInterval
}
extension UserPreference: Codable {
    private enum CodingKeys: String, CodingKey {
        case userID
        case goal
        case preferredWorkoutLength
    }
    init(snapshot: DocumentSnapshot) throws {
        let data = try snapshot.data(as: UserPreference.self)
        self.userID = data.userID
        self.goal = data.goal
        self.preferredWorkoutLength = data.preferredWorkoutLength
    }
}
