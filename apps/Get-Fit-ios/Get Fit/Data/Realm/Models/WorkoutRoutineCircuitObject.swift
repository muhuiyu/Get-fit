//
//  WorkoutRoutineCircuitObject.swift
//  Get Fit
//
//  Created by Mu Yu on 4/27/23.
//

import Foundation
import RealmSwift

final class WorkoutRoutineCircuitObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var type: WorkoutCircuitTypeString = WorkoutCircuitType.singleExercise.rawValue
    var sets = List<WorkoutSetObject>()
    
    convenience init(id: UUID, type: WorkoutCircuitTypeString, sets: List<WorkoutSetObject>) {
        self.init()
        self.id = id
        self.type = type
        self.sets = sets
    }
}
