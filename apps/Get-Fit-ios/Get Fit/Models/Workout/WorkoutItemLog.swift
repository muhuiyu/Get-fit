//
//  WorkoutItemLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

struct WorkoutItemLog: Codable {
    let itemID: WorkoutItemID
    var sets: [WorkoutSetLog]
    var note: String
    
    init(itemID: WorkoutItemID,
         sets: [WorkoutSetLog],
         note: String = "") {
        
        self.itemID = itemID
        self.sets = sets
        self.note = note
    }
}
