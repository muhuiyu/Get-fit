//
//  WorkoutSessionObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/25/23.
//

import Foundation
import RealmSwift

final class WorkoutSessionObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var userID: UserID = ""
    @objc dynamic var startTime: DateAndTimeObject?
    @objc dynamic var endTime: DateAndTimeObject?
    @objc dynamic var title: String = ""
    var circuits = List<WorkoutCircuitObject>()
    @objc dynamic var note: String = ""
    
    convenience init(id: UUID = UUID(), userID: UserID, startTime: DateAndTimeObject, endTime: DateAndTimeObject, title: String, circuits: List<WorkoutCircuitObject>, note: String) {
        self.init()
        self.userID = userID
        self.startTime = startTime
        self.endTime = endTime
        self.title = title
        self.circuits = circuits
        self.note = note
    }
}
