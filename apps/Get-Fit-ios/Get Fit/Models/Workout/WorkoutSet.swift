//
//  WorkoutSet.swift
//  Get Fit
//
//  Created by Mu Yu on 3/21/23.
//

import Foundation

struct WorkoutSet: Codable {
    var itemID: WorkoutItemID
    var weight: Double
    var reps: Int
    var note: String
    var type: WorkoutSetType
}
