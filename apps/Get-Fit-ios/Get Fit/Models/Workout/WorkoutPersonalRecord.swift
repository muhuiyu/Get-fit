//
//  WorkoutPersonalRecord.swift
//  Get Fit
//
//  Created by Mu Yu on 4/4/23.
//

import Foundation
import RealmSwift

typealias WorkoutPersonalRecordID = UUID

enum WorkoutPersonalRecordType {
    case weight
    case rep
}

struct WorkoutPersonalRecord: Codable {
    let id: WorkoutPersonalRecordID
    let itemID: WorkoutItemID
    let date: YearMonthDay
    var weight: Double
    var reps: Int
}

// MARK: - Persistable
extension WorkoutPersonalRecord: Persistable {
    public init(managedObject: WorkoutPersonalRecordObject) {
        id = managedObject.id
        itemID = managedObject.itemID
        if let date = managedObject.date {
            self.date = YearMonthDay(managedObject: date)
        } else {
            self.date = YearMonthDay.today
        }
        weight = managedObject.weight
        reps = managedObject.reps
    }
    public func managedObject() -> WorkoutPersonalRecordObject {
        return WorkoutPersonalRecordObject(id: id,
                                           itemID: itemID,
                                           date: date.managedObject(),
                                           weight: weight,
                                           reps: reps)
    }
}

