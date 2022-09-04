//
//  CustomizedMeal.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

typealias CustomizedMealID = String

struct CustomizedMeal {
    let id: CustomizedMealID
    var foodLogs: [FoodLog]
    var note: String
    
    init(id: CustomizedMealID,
         foodLogs: [FoodLog],
         note: String) {        
        self.id = id
        self.foodLogs = foodLogs
        self.note = note
    }
}

extension CustomizedMeal {
    static let testEntries: [CustomizedMeal] = [
        CustomizedMeal(id: "egg-chicken-thigh", foodLogs: [
            FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
            FoodLog(foodID: Food.chickenLeg.id, amount: 200, unit: .gram),
        ], note: ""),
        CustomizedMeal(id: "egg-ground-beef", foodLogs: [
            FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
            FoodLog(foodID: Food.groundBeef75.id, amount: 200, unit: .gram),
        ], note: "")
    ]
}
