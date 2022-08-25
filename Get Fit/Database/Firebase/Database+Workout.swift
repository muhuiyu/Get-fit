//
//  Database+Workout.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit

extension Database {
    func getWorkoutSessions(on date: DateTriple) -> [WorkoutSession] {
        // TODO: - connect to real data
        return WorkoutSession.testEntries
    }
    func getAllWorkoutSessions() -> [WorkoutSession] {
        return WorkoutSession.testEntries
    }
}
