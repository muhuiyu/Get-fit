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
