//
//  HealthKitWorkout.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import HealthKit

struct HealthKitWorkout {
    let name: String
    let minutes: Int
    let calories: Int
}

extension HealthKitWorkout {
    static func getActivityName(from type: HKWorkoutActivityType) -> String? {
        return "\(type)"
    }
}
