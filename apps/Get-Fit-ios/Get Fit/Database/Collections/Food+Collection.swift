//
//  FoodCollection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import Foundation

extension Food {
    static let all: [FoodID: Food] = [
        egg.id: egg,
        eggYolk.id: eggYolk,
        chickenBreast.id: chickenBreast,
        chickenLeg.id: chickenLeg,
        chickenWing.id: chickenWing,
        rawChickenSkin.id: rawChickenSkin,
        groundBeef80.id: groundBeef80,
        beefLiver.id: beefLiver,
        porkLard.id: porkLard,
    ]
    static let egg: Food = Food(id: "egg",
                                name: "Egg",
                                unitNutritions: [
                                    UnitNutrition(amount: 1,
                                                  unit: .each,
                                                  nutritionFacts: NutritionFacts(calories: 70, carbs: 0, protein: 6, fat: 5))
                                ])
    static let eggYolk: Food = Food(id: "egg-yolk",
                                name: "Egg yolk",
                                unitNutritions: [
                                    UnitNutrition(amount: 1,
                                                  unit: .each,
                                                  nutritionFacts: NutritionFacts(calories: 55, carbs: 0, protein: 2.7, fat: 4.5))
                                ])
    static let chickenBreast: Food = Food(id: "chicken-breast",
                                          name: "Chicken breast",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 105, carbs: 0, protein: 24, fat: 1))
                                          ])
    static let chickenLeg: Food = Food(id: "chicken-leg",
                                          name: "Chicken leg",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 184, carbs: 0, protein: 24, fat: 9))
                                          ])
    static let chickenFat: Food = Food(id: "chicken-fat",
                                          name: "Chicken fat",
                                          unitNutritions: [
                                            UnitNutrition(amount: 1,
                                                          unit: .tablespoon,
                                                          nutritionFacts: NutritionFacts(calories: 115, carbs: 0, protein: 0, fat: 12.8))
                                          ])
    static let chickenWing: Food = Food(id: "chicken-wing",
                                          name: "Chicken wing",
                                          unitNutritions: [
                                            UnitNutrition(amount: 1,
                                                          unit: .each,
                                                          nutritionFacts: NutritionFacts(calories: 81, carbs: 0, protein: 7.5, fat: 5.4))
                                          ])
    static let rawChickenSkin: Food = Food(id: "raw-chicken-skin",
                                          name: "Raw chicken skin",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 453, carbs: 0, protein: 20.3, fat: 40.6))
                                          ])
    static let groundBeef80: Food = Food(id: "ground-beef-80",
                                          name: "Ground beef 80/20",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 258, carbs: 0, protein: 17, fat: 21))
                                          ])
    static let groundBeef75: Food = Food(id: "ground-beef-75",
                                          name: "Ground beef 75/25",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 293, carbs: 0, protein: 16, fat: 25, fiber: 0, sugar: 0, cholesterol: 75, sodium: 66, potassium: 244, calcium: 21, vitaminA: 4, vitaminC: 0, vitaminB1: 0, vitaminB2: 0, vitaminB3: 4, vitaminB6: 0, vitaminB9: 8, cobalamin: 2))
                                          ])
    static let beefLiver: Food = Food(id: "beef-liver",
                                          name: "Beef liver",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 135, carbs: 3.9, protein: 20.4, fat: 3.6))
                                          ])
    static let porkLard: Food = Food(id: "pork-lard",
                                          name: "Pork lard",
                                          unitNutritions: [
                                            UnitNutrition(amount: 1,
                                                          unit: .tablespoon,
                                                          nutritionFacts: NutritionFacts(calories: 115, carbs: 0, protein: 0, fat: 12.8, vitaminD: 0.3, vitaminE: 0.1))
                                          ])
}
