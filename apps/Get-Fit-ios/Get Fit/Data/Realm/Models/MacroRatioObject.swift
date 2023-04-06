//
//  MacroRatioObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/29/23.
//

import Foundation
import RealmSwift

final class MacroRatioObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var carbs: Double = 0
    @objc dynamic var protein: Double = 0
    @objc dynamic var fat: Double = 0
    
    convenience init(id: UUID, carbs: Double, protein: Double, fat: Double) {
        self.init()
        self.id = id
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
    }
}
