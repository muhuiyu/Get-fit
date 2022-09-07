//
//  MealLog+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

extension MealLog {
    static let testEntries: [MealLog] = [
        // 8/31
        MealLog(hour: 5, minute: 58,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 60, unit: .gram),
                ]),
        MealLog(hour: 8, minute: 14,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                ]),
        
        
        // 9/1
        MealLog(hour: 4, minute: 30,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 3.5, unit: .each),
                ]),
        MealLog(hour: 5, minute: 30,
                foodLogs: [
                    FoodLog(foodID: Food.chickenWing.id, amount: 2, unit: .each),
                ]),
        MealLog(hour: 8, minute: 29,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 2.5, unit: .each),
                ]),
        MealLog(hour: 12, minute: 51,
                foodLogs: [
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 100, unit: .gram),
                ]),
        
        
        
        MealLog(hour: 4, minute: 57,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 150, unit: .gram),
                ]),
        MealLog(hour: 10, minute: 35,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 110, unit: .gram),
                    FoodLog(foodID: Food.porkLard.id, amount: 6, unit: .tablespoon),
                ]),
        
        
        
        MealLog(
            hour: 6, minute: 45,
                foodLogs: [
                    FoodLog(foodID: Food.groundBeef80.id, amount: 500, unit: .each),
                ]),
        MealLog(
            hour: 12, minute: 45,
            foodLogs: [
                FoodLog(foodID: Food.groundBeef80.id, amount: 200, unit: .each),
            ]),
        
        
        // 9/4
        MealLog(hour: 6, minute: 31,
                foodLogs: [
                    FoodLog(foodID: Food.groundBeef80.id, amount: 300, unit: .each),
                ]),
        MealLog(hour: 8, minute: 20,
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                ]),
        MealLog(hour: 10, minute: 28,
                foodLogs: [
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                ]),
        MealLog(hour: 13, minute: 15,
                foodLogs: [
                    FoodLog(foodID: Food.porkLard.id, amount: 2, unit: .tablespoon),
                ]),
    ]
}

extension DailyMealLog {
    static let testEntries: [DailyMealLog] = [
        DailyMealLog(id: "6aGg6TTqy5Cpt4TJr0p1",
                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                     year: 2022,
                     month: 8,
                     day: 29,
                     mealLogs: [
                        MealLog(hour: 5, minute: 39,
                                foodLogs: [
                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
                                    FoodLog(foodID: Food.chickenWing.id, amount: 8, unit: .each),
                                ]),
                        MealLog(hour: 8, minute: 10,
                                foodLogs: [
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 80, unit: .gram),
                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
                                ]),
                        MealLog(hour: 17, minute: 14,
                                foodLogs: [
                                    FoodLog(foodID: Food.porkLard.id, amount: 1, unit: .tablespoon),
                                ]),
                     ]),
        DailyMealLog(id: "fTuJhiQe41jxgWDFlsrV",
                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                     year: 2022,
                     month: 8,
                     day: 30,
                     mealLogs: [
                        MealLog(hour: 5, minute: 24,
                                foodLogs: [
                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
                                ]),
                        MealLog(hour: 7, minute: 12,
                                foodLogs: [
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 170, unit: .gram),
                                ]),
                        MealLog(hour: 10, minute: 10,
                                foodLogs: [
                                    FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
                                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
                                ]),
                        MealLog(hour: 14, minute: 28,
                                foodLogs: [
                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
                                ]),
                     ]),
        DailyMealLog(id: "T2OFFVtTDYMztA17gCM9",
                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                     year: 2022,
                     month: 9,
                     day: 5,
                     mealLogs: [
                        MealLog(hour: 7, minute: 15,
                                foodLogs: [
                                    FoodLog(foodID: Food.egg.id, amount: 10, unit: .each),
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                                    FoodLog(foodID: Food.chickenFat.id, amount: 10, unit: .gram),
                                ]),
                        MealLog(hour: 8, minute: 15,
                                foodLogs: [
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 30, unit: .gram),
                                    FoodLog(foodID: Food.groundBeef75.id, amount: 20, unit: .gram),
                                ]),
                        MealLog(hour: 9, minute: 15,
                                foodLogs: [
                                    FoodLog(foodID: Food.egg.id, amount: 1, unit: .each),
                                ]),
                     ]),
        DailyMealLog(id: "TaJicbJ7Ip304rpfVak7",
                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                     year: 2022,
                     month: 9,
                     day: 6,
                     mealLogs: [
                        MealLog(hour: 6, minute: 15,
                                foodLogs: [
                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
                                    FoodLog(foodID: Food.groundBeef75.id, amount: 150, unit: .gram),
                                ]),
                        MealLog(hour: 14, minute: 20,
                                foodLogs: [
                                    FoodLog(foodID: Food.eggYolk.id, amount: 4, unit: .each),
                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
                                    FoodLog(foodID: Food.groundBeef75.id, amount: 100, unit: .gram),
                                ]),
                     ]),
    ]
}
