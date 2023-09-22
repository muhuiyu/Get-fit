//
//  WorkoutCircuitObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/25/23.
//

import Foundation
import RealmSwift

final class WorkoutCircuitObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var date: YearMonthDayObject?
    @objc dynamic var type: WorkoutCircuitTypeString = WorkoutCircuitType.singleExercise.rawValue
    @objc dynamic var customizedTitle: String = ""
    var sets = List<WorkoutSetObject>()
    
    convenience init(id: UUID, date: YearMonthDayObject, type: WorkoutCircuitTypeString, sets: List<WorkoutSetObject>, customizedTitle: String) {
        self.init()
        self.id = id
        self.date = date
        self.type = type
        self.sets = sets
        self.customizedTitle = customizedTitle
    }
}
