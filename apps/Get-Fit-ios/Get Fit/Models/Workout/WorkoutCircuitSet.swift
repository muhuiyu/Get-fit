//
//  WorkoutCircuitSet.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

typealias WorkoutCircuit = [WorkoutCircuitSet]

struct WorkoutCircuitSet {
    let itemID: WorkoutItemID
    var weight: Double
    var reps: Int
    var note: String

    init(itemID: WorkoutItemID, weight: Double, reps: Int, note: String = "") {
        self.itemID = itemID
        self.weight = weight
        self.reps = reps
        self.note = note
    }
}
