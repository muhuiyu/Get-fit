//
//  WorkoutSetLog.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

enum WorkoutSetType: String, Codable {
    case normal
    case warmUp
    case dropSet
}

struct WorkoutSetLog: Codable {
    var weight: Double
    var reps: Int
    var note: String
    var type: WorkoutSetType

    init(weight: Double,
         reps: Int,
         note: String = "",
         type: WorkoutSetType = .normal) {
        
        self.weight = weight
        self.reps = reps
        self.note = note
        self.type = type
    }
}
