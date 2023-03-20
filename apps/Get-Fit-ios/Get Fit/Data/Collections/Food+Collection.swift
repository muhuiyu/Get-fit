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
        eggWhite.id: eggWhite,
        eggYolk.id: eggYolk,
        quailEgg.id: quailEgg,
        chickenBreast.id: chickenBreast,
        chickenLeg.id: chickenLeg,
        chickenWing.id: chickenWing,
        chickenFat.id: chickenFat,
        rawChickenSkin.id: rawChickenSkin,
        groundBeef80.id: groundBeef80,
        groundBeef75.id: groundBeef75,
        beefPrimeRibBoneless.id: beefPrimeRibBoneless,
        beefLiver.id: beefLiver,
        beefHeart.id: beefHeart,
        beefChuck.id: beefChuck,
        porkHeart.id: porkHeart,
        porkLard.id: porkLard,
        porkSkin.id: porkSkin,
        porkRind.id: porkRind,
        salmonSkin.id: salmonSkin,
        salmon.id: salmon,
        rawShrimp.id: rawShrimp,
        beefFatTrimming.id: beefFatTrimming,
        lambFatTrimming.id: lambFatTrimming,
        beefTallow.id: beefTallow,
        lambTallow.id: lambTallow,
        salmonHead.id: salmonHead,
        braggOrangicAppleCiderVinegar.id: braggOrangicAppleCiderVinegar,
        oxTail.id: oxTail,
    ]
    static let egg: Food = Food(id: "egg",
                                name: "Egg",
                                unitNutritions: [
                                    UnitNutrition(amount: 1,
                                                  unit: .each,
                                                  nutritionFacts: NutritionFacts(calories: 70, carbs: 0, protein: 6, fat: 5, cholesterol: 740, sodium: 280, potassium: 70))
                                ])
    static let eggYolk: Food = Food(id: "egg-yolk",
                                name: "Egg yolk",
                                unitNutritions: [
                                    UnitNutrition(amount: 1,
                                                  unit: .each,
                                                  nutritionFacts: NutritionFacts(calories: 53, carbs: 0, protein: 2.7, fat: 4.5))
                                ])
    static let eggWhite: Food = Food(id: "egg-white",
                                name: "Egg white",
                                unitNutritions: [
                                    UnitNutrition(amount: 1,
                                                  unit: .each,
                                                  nutritionFacts: NutritionFacts(calories: 17, carbs: 0, protein: 3.3, fat: 0.5))
                                ])
    static let quailEgg: Food = Food(id: "quailEgg", name: "Quail Egg", unitNutritions: [
        UnitNutrition(amount: 1,
                      unit: .each,
                      nutritionFacts: NutritionFacts(calories: 14, carbs: 0, protein: 1.2, fat: 1, cholesterol: 76, sodium: 13, potassium: 11.9, calcium: 5.8, iron: 0.3))])
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
                                                          nutritionFacts: NutritionFacts(calories: 115, carbs: 0, protein: 0, fat: 12.8)),
                                            UnitNutrition(amount: 10,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 90, carbs: 0, protein: 0, fat: 10))
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
    static let beefPrimeRibBoneless: Food = Food(id: "beefPrimeRibBoneless",
                                                 name: "Beef Prime Rib Boneless",
                                                 unitNutritions: [
                                                    UnitNutrition(amount: 100,
                                                                  unit: .gram,
                                                                  nutritionFacts: NutritionFacts(calories: 266, carbs: 0, protein: 25.91, fat: 17.32, fiber: 0, sugar: 0, cholesterol: 77, sodium: 217, potassium: 293, calcium: 8, iron: 2.45, vitaminA: 0, vitaminC: 0, vitaminB1: 0, vitaminB2: 0, vitaminB3: 4, vitaminB6: 0, vitaminB9: 0, cobalamin: 0))
                                          ])
    static let beefLiver: Food = Food(id: "beef-liver",
                                          name: "Beef liver",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 135, carbs: 3.89, protein: 20.36, fat: 3.63, cholesterol: 275, sodium: 60, potassium: 313, calcium: 5, iron: 4.9, vitaminA: 4968, vitaminC: 1.3, vitaminD: 0.1))
                                          ])
    static let beefHeart: Food = Food(id: "beef-heart",
                                          name: "Beef heart",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 112, carbs: 0.14, protein: 17.72, fat: 3.94, cholesterol: 124, sodium: 98, potassium: 287, calcium: 7, iron: 4.31, vitaminC: 2))
                                          ])
    static let porkHeart: Food = Food(id: "pork-heart",
                                          name: "Pork heart",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 118,
                                                                                         carbs: 1.33,
                                                                                         protein: 17.27,
                                                                                         fat: 4.36,
                                                                                         cholesterol: 131,
                                                                                         sodium: 56,
                                                                                         potassium: 244,
                                                                                         calcium: 5,
                                                                                         iron: 4.68,
                                                                                         vitaminA: 8,
                                                                                         vitaminC: 5.3
                                                                                        ))
                                          ])
    static let porkLard: Food = Food(id: "pork-lard",
                                          name: "Pork lard",
                                          unitNutritions: [
                                            UnitNutrition(amount: 1,
                                                          unit: .tablespoon,
                                                          nutritionFacts: NutritionFacts(calories: 115, carbs: 0, protein: 0, fat: 12.8, vitaminD: 0.3, vitaminE: 0.1))
                                          ])
    static let porkSkin: Food = Food(id: "pork-skin",
                                          name: "Pork skin",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 564, carbs: 0, protein: 7.1, fat: 35.3, cholesterol: 141.1, sodium: 1904.8, vitaminD: 0.3, vitaminE: 0.1))
                                          ])
    static let porkRind: Food = Food(id: "pork-rind",
                                          name: "Pork rind",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 544, carbs: 0, protein: 61.3, fat: 31.3, cholesterol: 95, sodium: 1818, potassium: 127))
                                          ])
    static let salmonSkin: Food = Food(id: "salmon-skin",
                                          name: "Salmon skin",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 188, carbs: 0, protein: 25.9, fat: 8.2, cholesterol: 58.8, sodium: 58.8, vitaminD: 0.3, vitaminE: 0.1))
                                          ])
    static let salmon: Food = Food(id: "salmon",
                                   name: "Salmon",
                                          unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 208,
                                                                                         carbs: 0,
                                                                                         protein: 20,
                                                                                         fat: 13,
                                                                                         cholesterol: 55,
                                                                                         sodium: 59,
                                                                                         potassium: 363,
                                                                                         calcium: 9,
                                                                                         magnesium: 27,
                                                                                         iron: 0.3,
                                                                                         vitaminC: 3.9,
                                                                                         vitaminB6: 0.6,
                                                                                         cobalamin: 3.2)),
                                          ])
    static let beefFatTrimming: Food = Food(id: "beefFatTrimming",
                                            name: "Beef Fat Trimming",
                                            unitNutritions: [
                                                UnitNutrition(amount: 100,
                                                              unit: .gram,
                                                              nutritionFacts: NutritionFacts(calories: 859,
                                                                                             carbs: 0,
                                                                                             protein: 1.77,
                                                                                             fat: 94.7,
                                                                                             cholesterol: 66.4,
                                                                                             sodium: 8.85,
                                                                                             potassium: 17.7,
                                                                                             iron: 0.18)),
                                            ])
    static let lambFatTrimming: Food = Food(id: "lambFatTrimming",
                                            name: "Lamb Fat Trimming",
                                            unitNutritions: [
                                                UnitNutrition(amount: 100,
                                                              unit: .gram,
                                                              nutritionFacts: NutritionFacts(calories: 859,
                                                                                             carbs: 0,
                                                                                             protein: 1.77,
                                                                                             fat: 94.7,
                                                                                             cholesterol: 66.4,
                                                                                             sodium: 8.85,
                                                                                             potassium: 17.7,
                                                                                             iron: 0.18)),
                                            ])
    static let beefTallow: Food = Food(id: "beefTallow",
                                       name: "Beef Tallow",
                                       unitNutritions: [
                                                UnitNutrition(amount: 1,
                                                              unit: .tablespoon,
                                                              nutritionFacts: NutritionFacts(calories: 115,
                                                                                             carbs: 0,
                                                                                             protein: 0,
                                                                                             fat: 12.8,
                                                                                             cholesterol: 14,
                                                                                             vitaminE: 0.35,
                                                                                             omega3: 100,
                                                                                             omega6: 200)),
                                            ])
    static let lambTallow: Food = Food(id: "lambTallow",
                                       name: "Lamb Tallow",
                                       unitNutritions: [
                                            UnitNutrition(amount: 100,
                                                          unit: .gram,
                                                          nutritionFacts: NutritionFacts(calories: 120,
                                                                                         carbs: 0,
                                                                                         protein: 0,
                                                                                         fat: 13.3,
                                                                                         cholesterol: 14,
                                                                                         vitaminE: 0.35,
                                                                                         omega3: 300,
                                                                                         omega6: 700)),
                                        ])
    static let salmonHead: Food = Food(id: "salmonHead",
                                       name: "Salmon Head",
                                       unitNutritions: [
                                        UnitNutrition(amount: 100,
                                                      unit: .gram,
                                                      nutritionFacts: NutritionFacts(calories: 69,
                                                                                     carbs: 0,
                                                                                     protein: 15,
                                                                                     fat: 0.9,
                                                                                     cholesterol: 48,
                                                                                     sodium: 372,
                                                                                     potassium: 124
                                                                                    ))
                                       ])
    static let braggOrangicAppleCiderVinegar: Food = Food(id: "braggOrangicAppleCiderVinegar",
                                                          name: "Bragg Organic Apple Cider Vinegar",
                                                          unitNutritions: [
                                                            UnitNutrition(amount: 1,
                                                                  unit: .tablespoon,
                                                                  nutritionFacts: NutritionFacts(calories: 0,
                                                                                                 carbs: 0,
                                                                                                 protein: 0,
                                                                                                 fat: 0,
                                                                                                 potassium: 11
                                                                                                ))
                                                          ])
    static let oxTail: Food = Food(id: "oxTail",
                                       name: "Ox Tail",
                                       unitNutritions: [
                                        UnitNutrition(amount: 100,
                                                      unit: .gram,
                                                      nutritionFacts: NutritionFacts(calories: 248,
                                                                                     carbs: 0,
                                                                                     protein: 27.4,
                                                                                     fat: 14.4,
                                                                                     cholesterol: 93.6,
                                                                                     sodium: 57.6,
                                                                                     potassium: 342.9
                                                                                    ))
                                       ])
    static let beefChuck: Food = Food(id: "beefChuck",
                                      name: "Beef Chuck",
                                      unitNutritions: [
                                        UnitNutrition(amount: 100,
                                                      unit: .gram,
                                                      nutritionFacts: NutritionFacts(calories: 191, carbs: 0, protein: 32.4, fat: 6.8, cholesterol: 98.9, sodium: 67, potassium: 318.8, calcium: 16.8, iron: 3))
                                      ])
    static let rawShrimp: Food = Food(id: "rawShrimp",
                                      name: "Raw Shrimp",
                                      unitNutritions: [
                                        UnitNutrition(amount: 100,
                                                      unit: .gram,
                                                      nutritionFacts: NutritionFacts(calories: 73, carbs: 0.9, protein: 13.9, fat: 1, cholesterol: 129.2, sodium: 578, potassium: 115.3, calcium: 54.4, iron: 0.2))
                                      ])
}
