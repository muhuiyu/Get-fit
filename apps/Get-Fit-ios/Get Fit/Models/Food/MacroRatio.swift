//
//  MacroRatio.swift
//  Get Fit
//
//  Created by Mu Yu on 9/11/22.
//

struct MacroRatio: Codable {
    var carbs: Double
    var protein: Double
    var fat: Double
}
extension MacroRatio {
    var isEmpty: Bool {
        return carbs == 0 && protein == 0 && fat == 0
    }
}
extension MacroRatio {
    init() {
        carbs = 0.3
        protein = 0.4
        fat = 0.3
    }
}

// MARK: - Persistable
extension MacroRatio: Persistable {
    public init(managedObject: MacroRatioObject) {
        carbs = managedObject.carbs
        protein = managedObject.protein
        fat = managedObject.fat
    }
    public func managedObject() -> MacroRatioObject {
        return MacroRatioObject(carbs: carbs, protein: protein, fat: fat)
    }
}
