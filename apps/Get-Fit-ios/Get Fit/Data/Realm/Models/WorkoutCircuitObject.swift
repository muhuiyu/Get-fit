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
    @objc dynamic var type: WorkoutCircuitTypeString = WorkoutCircuitType.singleExercise.rawValue
    var sets = List<WorkoutSetObject>()
    
    convenience init(type: WorkoutCircuitTypeString, sets: List<WorkoutSetObject>) {
        self.init()
        self.type = type
        self.sets = sets
    }
}
