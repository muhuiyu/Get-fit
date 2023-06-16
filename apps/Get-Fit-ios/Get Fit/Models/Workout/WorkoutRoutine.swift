//
//  WorkoutRoutine.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import Foundation
import RealmSwift

typealias WorkoutRoutineID = UUID

struct WorkoutRoutine: Codable {
    var id: WorkoutRoutineID
    var userID: UserID
    var title: String
    var circuits: [WorkoutRoutineCircuit]
    var note: String
    
    init(id: WorkoutRoutineID = UUID(),
         userID: UserID,
         title: String = "New Routine",
         circuits: [WorkoutRoutineCircuit] = [],
         note: String = "") {
        self.id = id
        self.userID = userID
        self.title = title
        self.circuits = circuits
        self.note = note
    }
}

// MARK: - Persistable
extension WorkoutRoutine: Persistable {
    public init(managedObject: WorkoutRoutineObject) {
        id = managedObject.id
        userID = managedObject.userID
        title = managedObject.title
        circuits = managedObject.circuits.map({ WorkoutRoutineCircuit(managedObject: $0) })
        note = managedObject.note
    }
    public func managedObject() -> WorkoutRoutineObject {
        let circuitObjects = List<WorkoutRoutineCircuitObject>()
        circuits.map({ $0.managedObject() }).forEach({ circuitObjects.append($0) })
        return WorkoutRoutineObject(id: id,
                                    userID: userID,
                                    title: title,
                                    circuits: circuitObjects,
                                    note: note)
    }
}


extension WorkoutRoutine {
    var allItemNames: String {
        return circuits
            .compactMap({ circuit in
                circuit.sets.compactMap({ WorkoutItem.getWorkoutItemName(of: $0.itemID) })
                    .reduce(into: Set<String>(), { $0.insert($1) })
                    .joined(separator: ", ")
            })
            .joined(separator: ", ")
    }
    var numberOfSets: Int {
        return circuits.reduce(into: 0) { $0 += $1.sets.count }
    }
    var totalWeight: Double {
        return circuits.reduce(into: 0) { $0 += $1.sets.reduce(into: 0) { $0 += $1.weight } }
    }
}
