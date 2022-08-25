//
//  CacheManager.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    
    // MARK: - Variables
    private let defaults = UserDefaults.standard
    private let preferredLanguageKey = "preferredLanguage"
    private init() {
        
    }
}

extension CacheManager {
    var preferredWorkoutLengthInMinutes: Int {
        // TODO: - 
        return 60
    }
    var preferredLanguage: Language {
        get {
            if let value = defaults.string(forKey: preferredLanguageKey) {
                return Language(rawValue: value) ?? .en
            }
            return .en
        }
        set {
            defaults.set(newValue.rawValue, forKey: preferredLanguageKey)
        }
    }
    var preferredTimezone: String {
        return "SGT"
    }
    var preferredWeightUnit: String {
        return "kg"
    }
    var preferredLengthUnit: String {
        return "cm"
    }
}

