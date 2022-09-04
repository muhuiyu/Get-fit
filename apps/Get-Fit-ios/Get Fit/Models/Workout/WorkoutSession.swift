//
//  WorkoutSession.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import UIKit

typealias WorkoutSessionID = String

struct WorkoutSession: WorkoutSessionInterface, Codable {
    var id: WorkoutSessionID
    var startTime: DateAndTime
    var endTime: DateAndTime
    var title: String
    var itemLogs: [WorkoutItemLog]
    var note: String

    init(id: WorkoutSessionID,
         startTime: DateAndTime,
         endTime: DateAndTime,
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
    init(preferredWorkoutLengthInMinutes: Int = 60) {
        // TODO: - set id
        self.id = "id"
        self.title = "New workout session"
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLengthInMinutes)
        self.itemLogs = []
        self.note = ""
    }
    init(from routine: WorkoutRoutine, preferredWorkoutLengthInMinutes: Int = 60) {
        // TODO: - Set id
        self.id = "id"
        self.title = routine.title
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLengthInMinutes)
        self.itemLogs = routine.itemLogs
        self.note = routine.note
    }
}

extension WorkoutSession {
    var durationInHourMinuteString: String {
        return DateAndTime.difference(from: startTime, to: endTime).toHourMinuteString(unitsStyle: .full)
    }
    var monthParsed: String {
        // note: may not apply if user exercises pass a day... (in the midnight)
        guard startTime.month == endTime.month else { return "" }
        return startTime.toDate()?.formatted(.dateTime.year().month(.wide)) ?? ""
    }
    var dayParsed: String {
        // note: may not apply if user exercises pass a day... (in the midnight)
        guard startTime.day == endTime.day else { return "" }
        return startTime.toDate()?.formatted(.dateTime.year().month(.wide)) ?? ""
    }
    var allItemNames: String {
        return itemLogs.compactMap { WorkoutItem.getWorkoutItemName(of: $0.itemID) }.joined(separator: ", ")
    }
}
