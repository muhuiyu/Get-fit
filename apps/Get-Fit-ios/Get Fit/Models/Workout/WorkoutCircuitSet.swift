//
//  WorkoutCircuit.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

enum WorkoutCircuitType: String, Codable {
    case singleExercise
    case superSet
    case circuit
}

struct WorkoutCircuit: Codable {
    let type: WorkoutCircuitType
    var sets: [WorkoutSet]
}
