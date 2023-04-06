//
//  WorkoutSet.swift
//  Get Fit
//
//  Created by Mu Yu on 3/21/23.
//

import Foundation

typealias WorkoutSetTypeString = String

enum WorkoutSetType: String, Codable {
    case normal
    case warmUp
    case dropSet
}

struct WorkoutSet: Codable {
    var id: UUID = UUID()
    var itemID: WorkoutItemID
    var type: WorkoutSetType
    var weight: Double
    var reps: Int
    var restTime: TimeInterval
    var note: String
}

// MARK: - Persistable
extension WorkoutSet: Persistable {
    public init(managedObject: WorkoutSetObject) {
        self.id = managedObject.id
        self.itemID = managedObject.itemID
        self.type = WorkoutSetType(rawValue: managedObject.type) ?? .normal
        self.weight = managedObject.weight
        self.reps = managedObject.reps
        self.restTime = managedObject.restTime
        self.note = managedObject.note
    }
    public func managedObject() -> WorkoutSetObject {
        return WorkoutSetObject(id: id, itemID: itemID, type: type.rawValue, weight: weight, reps: reps, restTime: restTime, note: note)
    }
}
