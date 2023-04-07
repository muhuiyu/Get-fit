//
//  WorkoutPersonalRecordObject.swift
//  Get Fit
//
//  Created by Mu Yu on 4/4/23.
//

import Foundation
import RealmSwift

final class WorkoutPersonalRecordObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: UUID = UUID()
    @objc var itemID: WorkoutItemID = ""
    @objc var date: YearMonthDayObject?
    @objc var weight: Double = 0
    @objc var reps: Int = 0
    
    convenience init(id: UUID, itemID: WorkoutItemID, date: YearMonthDayObject, weight: Double, reps: Int) {
        self.init()
        self.id = id
        self.itemID = itemID
        self.date = date
        self.weight = weight
        self.reps = reps
    }
}
