//
//  MealLog+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

extension MealLog {
    static let testEntries: [MealLog] = [
        MealLog(id: "2022-8-29-1",
                date: DateTriple(year: 2022, month: 8, day: 29),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 8, unit: .each),
                ]),
        MealLog(id: "2022-8-29-2",
                date: DateTriple(year: 2022, month: 8, day: 29),
                foodLogs: [
                    FoodLog(foodID: Food.chickenBreast.id, amount: 80, unit: .gram),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
                    FoodLog(foodID: Food.porkLard.id, amount: 1, unit: .tablespoon),
                ]),
        MealLog(id: "2022-8-30-1",
                date: DateTriple(year: 2022, month: 8, day: 30),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 170, unit: .gram),
                ]),
        MealLog(id: "2022-8-30-2",
                date: DateTriple(year: 2022, month: 8, day: 30),
                foodLogs: [
                    FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
                ]),
        MealLog(id: "2022-8-31-1",
                date: DateTriple(year: 2022, month: 8, day: 31),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 60, unit: .gram),
                ]),
        MealLog(id: "2022-8-31-2",
                date: DateTriple(year: 2022, month: 8, day: 31),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                ]),
        MealLog(id: "2022-9-1-1",
                date: DateTriple(year: 2022, month: 9, day: 1),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 5.5, unit: .each),
                ]),
        MealLog(id: "2022-9-1-2",
                date: DateTriple(year: 2022, month: 9, day: 1),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
                    FoodLog(foodID: Food.chickenWing.id, amount: 2.5, unit: .each),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 100, unit: .gram),
                ]),
        MealLog(id: "2022-9-2-1",
                date: DateTriple(year: 2022, month: 9, day: 2),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 150, unit: .gram),
                ]),
        MealLog(id: "2022-9-2-2",
                date: DateTriple(year: 2022, month: 9, day: 2),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
                    FoodLog(foodID: Food.chickenBreast.id, amount: 110, unit: .gram),
                    FoodLog(foodID: Food.porkLard.id, amount: 6, unit: .tablespoon),
                ]),
        MealLog(id: "2022-9-3-1",
                date: DateTriple(year: 2022, month: 9, day: 3),
                foodLogs: [
                    FoodLog(foodID: Food.groundBeef80.id, amount: 500, unit: .each),
                ]),
        MealLog(id: "2022-9-3-2",
                date: DateTriple(year: 2022, month: 9, day: 3),
                foodLogs: [
                    FoodLog(foodID: Food.groundBeef80.id, amount: 200, unit: .each),
                ]),
        MealLog(id: "2022-9-4-1",
                date: DateTriple(year: 2022, month: 9, day: 4),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
                    FoodLog(foodID: Food.groundBeef80.id, amount: 300, unit: .each),
                ]),
        MealLog(id: "2022-9-4-2",
                date: DateTriple(year: 2022, month: 9, day: 4),
                foodLogs: [
                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
                    FoodLog(foodID: Food.porkLard.id, amount: 2, unit: .tablespoon),
                ]),
        MealLog(id: "2022-9-5-1",
                date: DateTriple(year: 2022, month: 9, day: 5),
                foodLogs: [
                    FoodLog(foodID: Food.egg.id, amount: 10, unit: .each),
                    FoodLog(foodID: Food.chickenFat.id, amount: 1, unit: .tablespoon),
                ]),
        MealLog(id: "2022-9-5-2",
                date: DateTriple(year: 2022, month: 9, day: 5),
                foodLogs: [
                    FoodLog(foodID: Food.chickenBreast.id, amount: 300, unit: .gram),
                    FoodLog(foodID: Food.chickenFat.id, amount: 2, unit: .tablespoon),
                ]),
    ]
}
