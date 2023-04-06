//
//  WorkoutSetObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/25/23.
//

import Foundation
import RealmSwift

final class WorkoutSetObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var itemID: WorkoutItemID = ""
    @objc dynamic var type: WorkoutSetTypeString = WorkoutSetType.normal.rawValue
    @objc dynamic var weight: Double = 0
    @objc dynamic var reps: Int = 0
    @objc dynamic var restTime: TimeInterval = TimeInterval(60)
    @objc dynamic var note: String = ""
    
    convenience init(id: UUID, itemID: WorkoutItemID, type: WorkoutSetTypeString, weight: Double, reps: Int, restTime: TimeInterval, note: String) {
        self.init()
        self.id = id
        self.itemID = itemID
        self.type = type
        self.weight = weight
        self.reps = reps
        self.restTime = restTime
        self.note = note
    }
}
