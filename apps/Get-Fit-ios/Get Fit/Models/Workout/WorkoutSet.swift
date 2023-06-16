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
    
    init(id: UUID = UUID(),
         itemID: WorkoutItemID,
         type: WorkoutSetType = .normal,
         weight: Double = 0,
         reps: Int = 0,
         time: TimeInterval = TimeInterval(0),
         distanceInMeter: Double = 0,
         calories: Int = 0,
         restTime: TimeInterval = TimeInterval(60),
         note: String = "") {
        self.id = id
        self.itemID = itemID
        self.type = type
        self.weight = weight
        self.reps = reps
        self.time = time
        self.distanceInMeter = distanceInMeter
        self.calories = calories
        self.restTime = restTime
        self.note = note
    }
}

extension WorkoutSet {
    init(from lastSet: WorkoutSet) {
        self.init(itemID: lastSet.itemID, type: lastSet.type, weight: lastSet.weight, reps: lastSet.reps, time: lastSet.time, distanceInMeter: lastSet.distanceInMeter, calories: lastSet.calories, restTime: lastSet.restTime, note: lastSet.note)
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
