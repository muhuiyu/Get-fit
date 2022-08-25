//
//  WorkoutSessionList.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import Collections
import UIKit

typealias WorkoutSessionList = [WorkoutSession]
typealias WorkoutSessionGroup = OrderedDictionary<String, [WorkoutSession]>

extension WorkoutSessionList {
    mutating func remove(id: WorkoutSessionID) {
        guard let index = self.firstIndex(where: { $0.id == id }) else { return }
        self.remove(at: index)
    }
    func sortedByTime() -> WorkoutSessionList {
        return self.sorted(by: { $0.startTime < $1.startTime })
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
