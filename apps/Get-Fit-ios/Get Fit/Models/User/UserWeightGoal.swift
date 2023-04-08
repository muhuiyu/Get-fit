//
//  UserWeightGoal.swift
//  Get Fit
//
//  Created by Mu Yu on 4/7/23.
//

import Foundation

struct UserWeightGoal: Codable {
    var id: UUID = UUID()
    var startingWeight: Double
    var dateStarted: YearMonthDay
    var goalWeight: Double
}
