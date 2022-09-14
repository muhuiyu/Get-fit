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
    let preferredNumberOfMeals: Int
}
extension UserPreference: Codable {
    private struct UserPreferenceData: Codable {
        let userID: UserID
        let goal: UserGoal
        let preferredWorkoutLength: Int
        let preferredNumberOfMeals: Int
        
        private enum CodingKeys: String, CodingKey {
            case userID
            case goal
            case preferredWorkoutLength
            case preferredNumberOfMeals
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            userID = try container.decode(UserID.self, forKey: .userID)
            goal = try container.decode(UserGoal.self, forKey: .goal)
            preferredWorkoutLength = try container.decode(Int.self, forKey: .preferredWorkoutLength)
            preferredNumberOfMeals = try container.decode(Int.self, forKey: .preferredNumberOfMeals)
        }
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(userID, forKey: .userID)
            try container.encode(goal, forKey: .goal)
            try container.encode(preferredWorkoutLength, forKey: .preferredWorkoutLength)
            try container.encode(preferredNumberOfMeals, forKey: .preferredNumberOfMeals)
        }
    }
    init(snapshot: DocumentSnapshot) throws {
        let data = try snapshot.data(as: UserPreferenceData.self)
        self.userID = data.userID
        self.goal = data.goal
        self.preferredWorkoutLength = TimeInterval(data.preferredWorkoutLength)
        self.preferredNumberOfMeals = data.preferredNumberOfMeals
    }
}
