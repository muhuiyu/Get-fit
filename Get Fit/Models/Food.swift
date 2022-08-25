//
//  Food.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import Foundation

typealias FoodID = String

struct Food {
    let id: FoodID
    let name: String
    let unitNutrition: [FoodUnit: NutritionFacts]
    let note: String = ""
}

enum FoodUnit: String, Hashable {
    case tablespoon
    case mililiter
    case ounce
    case gram
}
