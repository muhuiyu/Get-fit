//
//  WorkoutSetLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

struct WorkoutSetLog: Codable {
    var weight: Double
    var reps: Int
    var note: String
    var isWarmUpSet: Bool

    init(weight: Double,
         reps: Int,
         note: String = "",
         isWarmUpSet: Bool = false) {
        
        self.weight = weight
        self.reps = reps
        self.note = note
        self.isWarmUpSet = isWarmUpSet
    }
}
