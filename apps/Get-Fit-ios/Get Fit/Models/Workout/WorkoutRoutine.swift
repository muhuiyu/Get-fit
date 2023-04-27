//
//  WorkoutRoutine.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import Foundation

typealias WorkoutRoutineID = UUID

struct WorkoutRoutine: WorkoutSessionInterface {
    var id: WorkoutRoutineID
    var title: String
    var circuits: [WorkoutCircuit]
    var note: String
    
    init(id: WorkoutRoutineID,
         title: String,
         circuits: [WorkoutCircuit],
         note: String = "") {
        self.id = id
        self.title = title
        self.circuits = circuits
        self.note = note
    }
}
extension WorkoutRoutine {
    init() {
        id = UUID()
        title = "New Routine"
        circuits = []
        note = ""
    }
}


// MARK: - WorkoutRoutineCircuit
struct
