//
//  MealLogList.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

typealias MealLogList = [MealLog]

extension MealLogList {
    var totalCalories: Int {
        return self.map { $0.totalCalories }.reduce(0, +)
    }
}
