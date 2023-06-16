//
//  WorkoutRoutineObject.swift
//  Get Fit
//
//  Created by Mu Yu on 4/27/23.
//

import Foundation
import RealmSwift

final class WorkoutRoutineObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var userID: UserID = UUID()
    @objc dynamic var title: String = ""
    var circuits = List<WorkoutRoutineCircuitObject>()
    @objc dynamic var note: String = ""
    
    convenience init(id: UUID,
                     userID: UserID,
                     title: String,
                     circuits: List<WorkoutRoutineCircuitObject>,
                     note: String) {
        self.init()
        self.id = id
        self.userID = userID
        self.title = title
        self.circuits = circuits
        self.note = note
    }
}
