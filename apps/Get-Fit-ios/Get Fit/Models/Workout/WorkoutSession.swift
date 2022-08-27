//
//  WorkoutSession.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import UIKit

typealias WorkoutSessionID = String

struct WorkoutSession: Codable {
    let id: WorkoutSessionID
    var startTime: Date
    var endTime: Date
    var title: String
    var itemLogs: [WorkoutItemLog]
    var note: String

    init(id: WorkoutSessionID,
         startTime: Date,
         endTime: Date,
         title: String,
         itemLogs:[WorkoutItemLog],
         note: String = "") {
        self.id = id
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.itemLogs = itemLogs
        self.note = note
    }
}
// MARK: - Init
extension WorkoutSession {
    init() {
        // TODO: - set id
        self.id = "id"
        self.title = "New workout session"
        self.startTime = Date()
        self.endTime = Date().date(afterMinutes: CacheManager.shared.preferredWorkoutLengthInMinutes)
        self.itemLogs = []
        self.note = ""
    }
    init(from routine: WorkoutRoutine) {
        // TODO: - Set id
        self.id = "id"
        self.title = routine.title
        self.startTime = Date()
        self.endTime = Date().date(afterMinutes: CacheManager.shared.preferredWorkoutLengthInMinutes)
        self.itemLogs = routine.itemLogs
        self.note = routine.note
    }
}

extension WorkoutSession {
    var durationInHourMinuteString: String {
        return (self.endTime - self.startTime).toHourMinuteString(unitsStyle: .full)
    }
    var monthParsed: String {
        // note: may not apply if user exercises pass a day... (in the midnight)
        guard startTime.month == endTime.month else { return "" }
        return startTime.formatted(.dateTime.year().month(.wide))
    }
    var dayParsed: String {
        // note: may not apply if user exercises pass a day... (in the midnight)
        guard startTime.dayOfMonth == endTime.dayOfMonth else { return "" }
        return startTime.formatted(.dateTime.year().month(.wide))
    }
}

// MARK: - Test entries
extension WorkoutSession {
    static let testEntries: [WorkoutSession] = [
        WorkoutSession(id: "workout-session-1",
                       startTime: Date(),
                       endTime: Date().date(afterMinutes: 35),
                       title: "Some session",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 65, reps: 15, isWarmUpSet: true),
                                WorkoutSetLog(weight: 65, reps: 15)
                            ],
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.assistedPullUp.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15, note: "good job!", isWarmUpSet: true),
                                WorkoutSetLog(weight: 12.5, reps: 15, note: "good job!", isWarmUpSet: false),
                            ],
                            note: "3 x 15"
                        ),
                       ])
    ]
}
