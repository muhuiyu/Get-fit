//
//  UserHealthData.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import HealthKit

struct UserHealthData {
    var biologicalSex: HKBiologicalSex = .notSet
    var basalEnergyBurned: Int = 0
    var activeEnergyBurned: Int = 0
    var stepCount: Int = 0
    var sleepHours: Double = 0
    var height: Double = 0
    var bodyMass: Double = 0
    var bodyFatPercentage: Double = 0
    var dietaryWater: Double = 0
}

extension UserHealthData {
    enum ObjectType: String, CaseIterable {
        case biologicalSex
        
        var toObjectType: HKObjectType? {
            switch self {
            case .biologicalSex:
                return HKSampleType.characteristicType(forIdentifier: .biologicalSex)
            }
        }
    }
    enum SampleType: String, CaseIterable {
        case basalEnergyBurned
        case activeEnergyBurned
        case stepCount
        case sleepHours
        case height
        case bodyMass
        case bodyFatPercentage
        case dietaryWater
        
        var toSampleType: HKSampleType? {
            switch self {
            case .basalEnergyBurned:
                return HKSampleType.quantityType(forIdentifier: .basalEnergyBurned)
            case .activeEnergyBurned:
                return HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)
            case .stepCount:
                return HKSampleType.quantityType(forIdentifier: .stepCount)
            case .sleepHours:
                return HKSampleType.categoryType(forIdentifier: .sleepAnalysis)
            case .height:
                return HKSampleType.quantityType(forIdentifier: .height)
            case .bodyMass:
                return HKSampleType.quantityType(forIdentifier: .bodyMass)
            case .bodyFatPercentage:
                return HKSampleType.quantityType(forIdentifier: .bodyFatPercentage)
            case .dietaryWater:
                return HKSampleType.quantityType(forIdentifier: .dietaryWater)
            }
        }
    }
}
extension UserHealthData {
    mutating func updateData(of type: SampleType, to value: HKSample?) {
        switch type {
        case .basalEnergyBurned:
            if let value = value as? HKQuantitySample {
                print("basalEnergyBurned => \(value.quantity)")
                self.basalEnergyBurned = Int(value.quantity.doubleValue(for: .kilocalorie()))
            }
        case .activeEnergyBurned:
            if let value = value as? HKQuantitySample {
                print("activeEnergyBurned => \(value.quantity)")
                self.activeEnergyBurned = Int(value.quantity.doubleValue(for: .kilocalorie()))
            }
        case .stepCount:
            if let value = value as? HKQuantitySample {
                print("step count => \(value.quantity)")
                self.stepCount = Int(value.quantity.doubleValue(for: .count()))
            }
        case .sleepHours:
            // TODO: -
            if let value = value as? HKCategorySample {
                print("sleep => \(value.sampleType)")
                self.sleepHours = 8.2
            }
        case .height:
            if let value = value as? HKQuantitySample {
                print("height => \(value.quantity)")
                self.height = value.quantity.doubleValue(for: .meter())
            }
        case .bodyMass:
            if let value = value as? HKQuantitySample {
                print("body mass => \(value.quantity)")
                self.bodyMass = value.quantity.doubleValue(for: .gramUnit(with: .kilo))
            }
        case .bodyFatPercentage:
            if let value = value as? HKQuantitySample {
                print("body fat percentage => \(value.quantity)")
                self.bodyFatPercentage = value.quantity.doubleValue(for: .percent())
            }
        case .dietaryWater:
            if let value = value as? HKQuantitySample {
                print("water => \(value.quantity)")
                self.dietaryWater = value.quantity.doubleValue(for: .percent())
            }
        }
    }
}
