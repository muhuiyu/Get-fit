//
//  WorkoutItemLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

import Foundation

struct WorkoutItemLog: Codable {
    let itemID: WorkoutItemID
    var sets: [WorkoutSetLog]
    var restTime: TimeInterval
    var note: String
    
    init(itemID: WorkoutItemID,
         sets: [WorkoutSetLog],
         restTime: TimeInterval,
         note: String = "") {
        
        self.itemID = itemID
        self.sets = sets
        self.restTime = restTime
        self.note = note
    }
}
