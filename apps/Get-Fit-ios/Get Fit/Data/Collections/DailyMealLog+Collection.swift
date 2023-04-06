//
//  DailyMealLog+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

//extension DailyMealLog {
//    static let testEntries: [DailyMealLog] = [
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 8,
//                     day: 29,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 39,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 8, unit: .each),
//                                ]),
//                        MealLog(hour: 8, minute: 10,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 80, unit: .gram),
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
//                                ]),
//                        MealLog(hour: 17, minute: 14,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.porkLard.id, amount: 1, unit: .tablespoon),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 8,
//                     day: 30,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 24,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
//                                ]),
//                        MealLog(hour: 7, minute: 12,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 170, unit: .gram),
//                                ]),
//                        MealLog(hour: 10, minute: 10,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
//                                ]),
//                        MealLog(hour: 14, minute: 28,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 68, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 8,
//                     day: 31,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 58,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 60, unit: .gram),
//                                ]),
//                        MealLog(hour: 8, minute: 14,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 1,
//                     mealLogs: [
//                        MealLog(hour: 4, minute: 30,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 3.5, unit: .each),
//                                ]),
//                        MealLog(hour: 5, minute: 30,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 2, unit: .each),
//                                ]),
//                        MealLog(hour: 8, minute: 29,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 2.5, unit: .each),
//                                ]),
//                        MealLog(hour: 12, minute: 51,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 100, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 2,
//                     mealLogs: [
//                        MealLog(hour: 4, minute: 57,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 150, unit: .gram),
//                                ]),
//                        MealLog(hour: 10, minute: 35,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 110, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 6, unit: .tablespoon),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 3,
//                     mealLogs: [
//                        MealLog(
//                            hour: 6, minute: 45,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.groundBeef80.id, amount: 500, unit: .each),
//                                ]),
//                        MealLog(
//                            hour: 12, minute: 45,
//                            foodLogs: [
//                                FoodLog(foodID: Food.groundBeef80.id, amount: 200, unit: .each),
//                            ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 4,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 31,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.groundBeef80.id, amount: 300, unit: .each),
//                                ]),
//                        MealLog(hour: 8, minute: 20,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
//                                ]),
//                        MealLog(hour: 10, minute: 28,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                ]),
//                        MealLog(hour: 13, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.porkLard.id, amount: 2, unit: .tablespoon),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 5,
//                     mealLogs: [
//                        MealLog(hour: 7, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 10, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 10, unit: .gram),
//                                ]),
//                        MealLog(hour: 8, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 30, unit: .gram),
//                                    FoodLog(foodID: Food.groundBeef75.id, amount: 20, unit: .gram),
//                                ]),
//                        MealLog(hour: 9, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 1, unit: .each),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 6,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.groundBeef75.id, amount: 150, unit: .gram),
//                                ]),
//                        MealLog(hour: 14, minute: 20,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.eggYolk.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
//                                    FoodLog(foodID: Food.groundBeef75.id, amount: 100, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 7,
//                     mealLogs: [
//                        MealLog(hour: 7, minute: 18,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.groundBeef75.id, amount: 300, unit: .gram),
//                                ]),
//                        MealLog(hour: 10, minute: 25,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 150, unit: .gram),
//                                ]),
//                        MealLog(hour: 15, minute: 11,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 8,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 10,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 5.5, unit: .each),
//                                ]),
//                        MealLog(hour: 11, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenWing.id, amount: 2.5, unit: .each),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 9,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 10,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenLeg.id, amount: 500, unit: .gram),
//                                ]),
//                        MealLog(hour: 11, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 10,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 35,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 6, unit: .each),
//                                    FoodLog(foodID: Food.eggYolk.id, amount: 3, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 10, unit: .gram),
//                                ]),
//                        MealLog(hour: 15, minute: 10,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.eggWhite.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.rawChickenSkin.id, amount: 34, unit: .gram),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 5, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 11,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 40,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 6, unit: .each),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 30, unit: .gram),
//                                ]),
//                        MealLog(hour: 13, minute: 30,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 15, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 12,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 50,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 10, unit: .each),
//                                    FoodLog(foodID: Food.chickenFat.id, amount: 30, unit: .gram),
//                                ]),
//                        MealLog(hour: 5, minute: 50,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 13,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 35,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.porkSkin.id, amount: 240, unit: .gram),
//                                ]),
//                        MealLog(hour: 12, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 120, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 14,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 55,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.porkLard.id, amount: 60, unit: .gram),
//                                    FoodLog(foodID: Food.porkSkin.id, amount: 240, unit: .gram),
//                                ]),
//                        MealLog(hour: 11, minute: 24,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 1, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 15, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 15,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 45,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 60, unit: .gram),
//                                ]),
//                        MealLog(hour: 12, minute: 38,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 4, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 50, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 15, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 16,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 05,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 100, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 20, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 17,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 45,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 200, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 80, unit: .gram),
//                                    FoodLog(foodID: Food.beefLiver.id, amount: 120, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 18,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 15,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 160, unit: .gram),
//                                    FoodLog(foodID: Food.beefLiver.id, amount: 120, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 19,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 30,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 2, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 160, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 20,
//                     mealLogs: [
//                        MealLog(hour: 4, minute: 40,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 300, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 160, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 21,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 30,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 250, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 160, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 22,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 38,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 250, unit: .gram),
//                                    FoodLog(foodID: Food.porkRind.id, amount: 100, unit: .gram),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 30, unit: .gram),
//                                ]),
//                        MealLog(hour: 11, minute: 20,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.porkRind.id, amount: 100, unit: .gram),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 23,
//                     mealLogs: [
//                        MealLog(hour: 5, minute: 38,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 150, unit: .gram),
//                                    FoodLog(foodID: Food.egg.id, amount: 10, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 15, unit: .gram),
//                                ]),
//                        MealLog(hour: 11, minute: 37,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 3, unit: .each),
//                                ]),
//                     ]),
//        DailyMealLog(id: "",
//                     userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                     year: 2022,
//                     month: 9,
//                     day: 24,
//                     mealLogs: [
//                        MealLog(hour: 6, minute: 12,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.egg.id, amount: 8, unit: .each),
//                                    FoodLog(foodID: Food.porkLard.id, amount: 30, unit: .gram),
//                                    FoodLog(foodID: Food.salmonSkin.id, amount: 150, unit: .gram),
//                                ]),
//                        MealLog(hour: 9, minute: 37,
//                                foodLogs: [
//                                    FoodLog(foodID: Food.chickenBreast.id, amount: 280, unit: .gram),
//                                ]),
//                     ]),
//    ]
//}
