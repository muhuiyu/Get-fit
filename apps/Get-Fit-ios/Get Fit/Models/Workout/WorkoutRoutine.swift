//
//  WorkoutRoutine.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

typealias WorkoutRoutineID = String

struct WorkoutRoutine: WorkoutSessionInterface {
    var id: WorkoutRoutineID
    var title: String
    var itemLogs: [WorkoutItemLog]
    var note: String
    
    init(id: WorkoutRoutineID,
         title: String,
         itemLogs: [WorkoutItemLog],
         note: String = "") {
        self.id = id
        self.title = title
        self.itemLogs = itemLogs
        self.note = note
    }
}
extension WorkoutRoutine {
    init() {
        id = ""
        title = "New Routine"
        itemLogs = []
        note = ""
    }
}
extension WorkoutRoutine {
    var allItemNames: String {
        return itemLogs.compactMap { WorkoutItem.getWorkoutItemName(of: $0.itemID) }.joined(separator: ", ")
    }
}
