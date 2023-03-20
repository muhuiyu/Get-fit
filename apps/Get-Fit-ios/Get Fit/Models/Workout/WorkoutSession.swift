//
//  WorkoutSession.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

typealias WorkoutSessionID = String

struct WorkoutSession: WorkoutSessionInterface, Codable {
    var id: WorkoutSessionID
    var userID: UserID
    var startTime: DateAndTime
    var endTime: DateAndTime
    var title: String
    var itemLogs: [WorkoutItemLog]
    var note: String
    
    // Firebase
    static var collectionName: String { "workoutSessions" }

    init(id: WorkoutSessionID,
         userID: UserID,
         startTime: DateAndTime,
         endTime: DateAndTime,
         title: String,
         itemLogs:[WorkoutItemLog],
         note: String = "") {
        self.id = id
        self.userID = userID
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.itemLogs = itemLogs
        self.note = note
    }
}
// MARK: - Init
extension WorkoutSession {
    init(userID: UserID,
         preferredWorkoutLength: TimeInterval) {
        
        // TODO: - set id
        self.id = "id"
        self.userID = userID
        self.title = "New workout session"
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLength.minute)
        self.itemLogs = []
        self.note = ""
    }
    init(createdFrom routine: WorkoutRoutine,
         userID: UserID,
         preferredWorkoutLength: TimeInterval) {

        // TODO: - Set id
        self.id = "id"
        self.userID = userID
        self.title = routine.title
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLength.minute)
        self.itemLogs = routine.itemLogs
        self.note = routine.note
    }
    private struct WorkoutSessionData: Codable {
        var userID: UserID
        var startTime: DateAndTime
        var endTime: DateAndTime
        var title: String
        var itemLogs: [WorkoutItemLog]
        var note: String
    }
    init(snapshot: DocumentSnapshot) throws {
        id = snapshot.documentID
        let data = try snapshot.data(as: WorkoutSessionData.self)
        userID = data.userID
        startTime = data.startTime
        endTime = data.endTime
        title = data.title
        itemLogs = data.itemLogs
        note = data.note
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
    var previewText: String {
        return itemLogs
            .compactMap({ WorkoutItem.getWorkoutItem(of: $0.itemID)?.name })
            .joined(separator: ", ")
    }
}
