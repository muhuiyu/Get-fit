//
//  WorkoutSession.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import UIKit
import Collections
import RealmSwift

typealias WorkoutSessionID = UUID

struct WorkoutSession: WorkoutSessionInterface, Codable {
    var id: WorkoutSessionID
    var userID: UserID
    var startTime: DateAndTime
    var endTime: DateAndTime
    var title: String
    var circuits: [WorkoutCircuit]
    var note: String
    
    // Firebase
    static var collectionName: String { "workoutSessions" }

    init(id: WorkoutSessionID,
         userID: UserID,
         startTime: DateAndTime,
         endTime: DateAndTime,
         title: String,
         circuits: [WorkoutCircuit],
         note: String = "") {
        self.id = id
        self.userID = userID
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.circuits = circuits
        self.note = note
    }
}
// MARK: - Init
extension WorkoutSession {
    init(userID: UserID,
         preferredWorkoutLength: TimeInterval) {
        self.id = UUID()
        self.userID = userID
        self.title = "New workout session"
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLength.minute)
        self.circuits = []
        self.note = ""
    }
    init(createdFrom routine: WorkoutRoutine,
         userID: UserID,
         preferredWorkoutLength: TimeInterval) {
        self.id = UUID()
        self.userID = userID
        self.title = routine.title
        self.startTime = DateAndTime()
        self.endTime = self.startTime.afterMinutes(preferredWorkoutLength.minute)
        self.circuits = routine.circuits
        self.note = routine.note
    }
    private struct WorkoutSessionData: Codable {
        var userID: UserID
        var startTime: DateAndTime
        var endTime: DateAndTime
        var title: String
        var circuits: [WorkoutCircuit]
        var note: String
    }
}

// MARK: - Persistable
extension WorkoutSession: Persistable {
    public init(managedObject: WorkoutSessionObject) {
        id = managedObject.id
        userID = managedObject.userID
        if let startTime = managedObject.startTime {
            self.startTime = DateAndTime(managedObject: startTime)
        } else {
            self.startTime = DateAndTime()
        }
        if let endTime = managedObject.endTime {
            self.endTime = DateAndTime(managedObject: endTime)
        } else {
            self.endTime = DateAndTime()
        }
        title = managedObject.title
        circuits = managedObject.circuits.map({ WorkoutCircuit(managedObject: $0) })
        note = managedObject.note
    }
    public func managedObject() -> WorkoutSessionObject {
        let circuitObjects = List<WorkoutCircuitObject>()
        circuits.map({ $0.managedObject() }).forEach({ circuitObjects.append($0) })
        return WorkoutSessionObject(id: id, userID: userID, startTime: startTime.managedObject(), endTime: endTime.managedObject(), title: title, circuits: circuitObjects, note: note)
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
    var dateString: String {
        return startTime.dateString
    }
    var sessionPreviewCellSummary: String {
        let weightString = "Total weight: " + String(totalWeight)
        let setString = "Total sets: " + String(numberOfSets)
        return weightString + ", " + setString
    }
}

// MARK: - WorkoutSessionList
typealias WorkoutSessionList = [WorkoutSession]
typealias WorkoutSessionGroup = OrderedDictionary<String, [WorkoutSession]>

extension WorkoutSessionList {
    mutating func remove(id: WorkoutSessionID) {
        guard let index = self.firstIndex(where: { $0.id == id }) else { return }
        self.remove(at: index)
    }
    func sortedByTime(isAscending: Bool = true) -> WorkoutSessionList {
        return self.sorted(by: {
            guard let first = $0.startTime.toDate(), let second = $1.startTime.toDate() else { return false }
            if isAscending {
                return first < second
            } else {
                return first > second
            }
        })
    }
}

extension WorkoutSessionList {
    func groupedByMonth() -> WorkoutSessionGroup {
        guard !self.isEmpty else { return [:] }
        let groupedSessions = WorkoutSessionGroup(grouping: self) { $0.monthParsed }
        return groupedSessions
    }
    func groupedByDay() -> WorkoutSessionGroup {
        guard !self.isEmpty else { return [:] }
        let groupedSessions = WorkoutSessionGroup(grouping: self) { $0.dayParsed }
        return groupedSessions
    }
}
