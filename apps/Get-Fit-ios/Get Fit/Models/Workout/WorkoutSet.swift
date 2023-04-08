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
    var time: TimeInterval
    var distanceInMeter: Double
    var calories: Int
    var restTime: TimeInterval
    var note: String
}

extension WorkoutSet {
    init(from lastSet: WorkoutSet) {
        self.id = UUID()
        self.itemID = lastSet.itemID
        self.type = lastSet.type
        self.weight = lastSet.weight
        self.reps = lastSet.reps
        self.time = lastSet.time
        self.distanceInMeter = lastSet.distanceInMeter
        self.calories = lastSet.calories
        self.restTime = lastSet.restTime
        self.note = lastSet.note
    }
}

// MARK: - Persistable
extension WorkoutSet: Persistable {
    public init(managedObject: WorkoutSetObject) {
        self.id = managedObject.id
        self.itemID = managedObject.itemID
        self.type = WorkoutSetType(rawValue: managedObject.type) ?? .normal
        self.weight = managedObject.weight
        self.reps = managedObject.reps
        self.time = managedObject.time
        self.distanceInMeter = managedObject.distanceInMeter
        self.calories = managedObject.calories
        self.restTime = managedObject.restTime
        self.note = managedObject.note
    }
    public func managedObject() -> WorkoutSetObject {
        return WorkoutSetObject(id: id, itemID: itemID, type: type.rawValue, weight: weight, reps: reps, time: time, distanceInMeter: distanceInMeter, calories: calories, restTime: restTime, note: note)
    }
}
