//
//  WorkoutSet.swift
//  Get Fit
//
//  Created by Mu Yu on 3/21/23.
//

import Foundation

enum WorkoutSetType: String, Codable {
    case normal
    case warmUp
    case dropSet
}

struct WorkoutSet: Codable {
    var itemID: WorkoutItemID
    var type: WorkoutSetType
    var weight: Double
    var reps: Int
    var restTime: TimeInterval
    var note: String
}
