//
//  NutritionFacts.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

struct NutritionFacts {
    var calories: Int
    var carbs: Double
    var protein: Double
    var fat: Double
    
    var fiber: Double?
    var sugar: Double?
    
    var cholesterol: Double?
    var sodium: Double?
    var potassium: Double?
    var calcium: Double?
    var magnesium: Double?
    var iron: Double?
    
    var vitaminA: Double?
    var vitaminC: Double?
    var vitaminD: Double?
    var vitaminE: Double?
    var vitaminK: Double?
    var vitaminB1: Double?
    var vitaminB2: Double?
    var vitaminB3: Double?
    var vitaminB6: Double?
    var vitaminB9: Double?
    var cobalamin: Double?  // vitamin B12
    
    var omega3: Double?
    var omega6: Double?
    
    init(calories: Int,
         carbs: Double,
         protein: Double,
         fat: Double,
         fiber: Double? = nil,
         sugar: Double? = nil,
         cholesterol: Double? = nil,
         sodium: Double? = nil,
         potassium: Double? = nil,
         calcium: Double? = nil,
         magnesium: Double? = nil,
         iron: Double? = nil,
         vitaminA: Double? = nil,
         vitaminC: Double? = nil,
         vitaminD: Double? = nil,
         vitaminE: Double? = nil,
         vitaminK: Double? = nil,
         vitaminB1: Double? = nil,
         vitaminB2: Double? = nil,
         vitaminB3: Double? = nil,
         vitaminB6: Double? = nil,
         vitaminB9: Double? = nil,
         cobalamin: Double? = nil,
         omega3: Double? = nil,
         omega6: Double? = nil
    ) {
        
        self.calories = calories
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        
        self.fiber = fiber
        self.sugar = sugar
        self.cholesterol = cholesterol
        self.sodium = sodium
        self.potassium = potassium
        self.calcium = calcium
        self.magnesium = magnesium
        self.iron = iron
        self.vitaminA = vitaminA
        self.vitaminC = vitaminC
        self.vitaminD = vitaminD
        self.vitaminE = vitaminE
        self.vitaminK = vitaminK
        self.vitaminB1 = vitaminB1
        self.vitaminB2 = vitaminB2
        self.vitaminB3 = vitaminB3
        self.vitaminB6 = vitaminB6
        self.vitaminB9 = vitaminB9
        self.cobalamin = cobalamin
        self.omega3 = omega3
        self.omega6 = omega6
    }
}

extension NutritionFacts {
    func multiply(by multiplier: Double) -> NutritionFacts {
        var newValue = NutritionFacts(calories: Int(Double(self.calories) * multiplier),
                                      carbs: self.carbs * multiplier,
                                      protein: self.protein * multiplier,
                                      fat: self.fat * multiplier)
        if let fiber = self.fiber {
            newValue.fiber = fiber * multiplier
        }
        if let sugar = self.sugar {
            newValue.sugar = sugar * multiplier
        }
        if let cholesterol = self.cholesterol {
            newValue.cholesterol = cholesterol * multiplier
        }
        if let sodium = self.sodium {
            newValue.sodium = sodium * multiplier
        }
        if let potassium = self.potassium {
            newValue.potassium = potassium * multiplier
        }
        if let calcium = self.calcium {
            newValue.calcium = calcium * multiplier
        }
        if let magnesium = self.magnesium {
            newValue.magnesium = magnesium * multiplier
        }
        if let iron = self.iron {
            newValue.iron = iron * multiplier
        }
        if let vitaminA = self.vitaminA {
            newValue.vitaminA = vitaminA * multiplier
        }
        if let vitaminC = self.vitaminC {
            newValue.vitaminC = vitaminC * multiplier
        }
        if let vitaminD = self.vitaminD {
            newValue.vitaminD = vitaminD * multiplier
        }
        if let vitaminK = self.vitaminK {
            newValue.vitaminK = vitaminK * multiplier
        }
        if let vitaminE = self.vitaminE {
            newValue.vitaminE = vitaminE * multiplier
        }
        if let vitaminB1 = self.vitaminB1 {
            newValue.vitaminB1 = vitaminB1 * multiplier
        }
        if let vitaminB2 = self.vitaminB2 {
            newValue.vitaminB2 = vitaminB2 * multiplier
        }
        if let vitaminB3 = self.vitaminB3 {
            newValue.vitaminB3 = vitaminB3 * multiplier
        }
        if let vitaminB6 = self.vitaminB6 {
            newValue.vitaminB6 = vitaminB6 * multiplier
        }
        if let vitaminB9 = self.vitaminB9 {
            newValue.vitaminB9 = vitaminB9 * multiplier
        }
        if let cobalamin = self.cobalamin {
            newValue.cobalamin = cobalamin * multiplier
        }
        return newValue
    }
}
extension NutritionFacts: Codable {
    
}
