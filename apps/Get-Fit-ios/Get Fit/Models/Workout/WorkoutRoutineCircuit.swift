//
//  WorkoutRoutineCircuit.swift
//  Get Fit
//
//  Created by Mu Yu on 4/27/23.
//

import Foundation
import RealmSwift

// MARK: - WorkoutRoutineCircuit
struct WorkoutRoutineCircuit: Codable {
    let id: WorkoutCircuitID
    var type: WorkoutCircuitType
    var sets: [WorkoutSet]
    
    init(id: WorkoutCircuitID = UUID(),
         type: WorkoutCircuitType,
         sets: [WorkoutSet] = []) {
        self.id = id
        self.type = type
        self.sets = sets
    }
}

// MARK: - Persistable
extension WorkoutRoutineCircuit: Persistable {
    public init(managedObject: WorkoutRoutineCircuitObject) {
        id = managedObject.id
        type = WorkoutCircuitType(rawValue: managedObject.type) ?? .singleExercise
        sets = managedObject.sets.map({ WorkoutSet(managedObject: $0) })
    }
    public func managedObject() -> WorkoutRoutineCircuitObject {
        let setObjects = List<WorkoutSetObject>()
        sets.map({ $0.managedObject() }).forEach({ setObjects.append($0) })
        return WorkoutRoutineCircuitObject(id: id, type: type.rawValue, sets: setObjects)
    }
}

extension WorkoutRoutineCircuit {
    func toWorkoutCircuit() -> WorkoutCircuit {
        return WorkoutCircuit(date: YearMonthDay.today, type: type, sets: sets)
    }
}
