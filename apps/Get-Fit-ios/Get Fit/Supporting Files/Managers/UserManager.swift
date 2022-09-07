//
//  UserManager.swift
//  Why am I so poor
//
//  Created by Mu Yu on 8/2/22.
//

import UIKit
import HealthKit

class UserManager {
    private var user: User?
    private var healthStore = HKHealthStore()
    private var hasRequestedHealthData = false
    private var healthData = [DateTriple: UserHealthData]()
    private var workoutData = [DateTriple: [HKWorkout]]()
    
    init() {
        setupHealthRequest()
    }
}
// MARK: - User
extension UserManager {
    var isUserLoggedIn: Bool { return user != nil }
}
// MARK: - Get data
extension UserManager {
    var id: UserID? { user?.id }
    var name: String? { user?.displayName }
    var email: String? { user?.email }
    var photoURL: URL? { user?.photoURL }
    var loggedFoods: [FoodID: AmountAndUnit] {
        return user?.loggedFoods ?? [:]
    }
    var preferredWorkoutLength: TimeInterval {
        return user?.preferredWorkoutLength ?? 60
    }
    
    // Goal
    func getMacroGramGoal(for item: MacroItem) -> Double {
        switch item {
        case .carbs:
            return user?.goal.carbsGramGoal ?? 0
        case .protein:
            return user?.goal.proteinGramGoal ?? 0
        case .fat:
            return user?.goal.fatGramGoal ?? 0
        }
    }
    var dailyDietaryCaloriesGoal: Int {  user?.goal.dailyDietaryCalories ?? 0 }
    var stepCountGoal: Int { user?.goal.stepCountGoal ?? 0 }
    var sleepHoursGoal: Double { user?.goal.sleepHoursGoal ?? 0 }
    var waterIntakeGoal: Double { user?.goal.waterIntakeGoal ?? 0 }
    
    // Health
    func stepCount(on date: Date) -> Int { healthData[date.toDateTriple]?.stepCount ?? 0 }
    func sleepHours(on date: Date) -> Double { healthData[date.toDateTriple]?.sleepHours ?? 0 }
    func basalEnergyBurned(on date: Date) -> Int { healthData[date.toDateTriple]?.basalEnergyBurned ?? 0 }
    func activeEnergyBurned(on date: Date) -> Int { healthData[date.toDateTriple]?.activeEnergyBurned ?? 0 }
    func totalEnergyBurned(on date: Date) -> Int { self.basalEnergyBurned(on: date) + self.activeEnergyBurned(on: date) }
    func height(on date: Date) -> Double { healthData[date.toDateTriple]?.height ?? 0 }
    func bodyMass(on date: Date) -> Double { healthData[date.toDateTriple]?.bodyMass ?? 0 }
    func bodyFatPercentage(on date: Date) -> Double { healthData[date.toDateTriple]?.bodyFatPercentage ?? 0 }
    func dietaryWater(on date: Date) -> Double { healthData[date.toDateTriple]?.dietaryWater ?? 0 }
    
    // Workout
    func workout(on date: Date) -> [HKWorkout] { workoutData[date.toDateTriple] ?? [] }
}
// MARK: - Set data
extension UserManager {
    func setData(to attribute: User.Attribute, to value: Any) {
        if self.user == nil {
            self.user = User()
        }
        switch attribute {
        case .id:
            if let value = value as? UserID {
                user?.id = value
            }
        case .displayName:
            if let value = value as? String {
                user?.displayName = value
            }
        case .email:
            if let value = value as? String {
                user?.email = value
            }
        case .photoURL:
            if let value = value as? URL {
                user?.photoURL = value
            }
        case .goal:
            if let value = value as? UserGoal {
                user?.goal = value
            }
        case .preferredWorkoutLength:
            if let value = value as? TimeInterval {
                user?.preferredWorkoutLength = value
            }
        }
    }
    func setPreference(_ preference: UserPreference) {
        if self.user == nil {
            self.user = User()
        }
        user?.goal = preference.goal
        user?.preferredWorkoutLength = preference.preferredWorkoutLength
    }
    func setData(_ user: User) {
        self.user = user
    }
    func clearData() {
        self.user?.clearData()
    }
}
// MARK: - Set HealthKit Request
extension UserManager {
    func setupHealthRequest() {
        let requestAuthorizationResultHandler: ((Bool, Error?) -> Void) = { success, error in
            if let error = error {
                ErrorHandler.shared.handle(error)
            }
            else if success {
                if self.hasRequestedHealthData {
                    print("You've already requested access to health data. ")
                } else {
                    print("HealthKit authorization request was successful! ")
                }
                self.hasRequestedHealthData = true
            } else {
                print("HealthKit authorization failed.")
            }
        }
        if HKHealthStore.isHealthDataAvailable() {
            guard
                // TODO: - add more read types
                let biologicalSexType = UserHealthData.ObjectType.biologicalSex.toObjectType,
                let stepCountType = UserHealthData.SampleType.stepCount.toSampleType,
                let sleepAnalysistype = UserHealthData.SampleType.sleepHours.toSampleType,
                let basalEnergyBurnedType = UserHealthData.SampleType.basalEnergyBurned.toSampleType,
                let activeEnergyBurned = UserHealthData.SampleType.activeEnergyBurned.toSampleType,
                let height = UserHealthData.SampleType.height.toSampleType,
                let bodyMass = UserHealthData.SampleType.bodyMass.toSampleType,
                let bodyFatPercentage = UserHealthData.SampleType.bodyFatPercentage.toSampleType,
                let dietaryWater = UserHealthData.SampleType.dietaryWater.toSampleType else {
                return
            }
            let readTypes = Set([
                biologicalSexType,
                stepCountType,
                sleepAnalysistype,
                basalEnergyBurnedType,
                activeEnergyBurned,
                height,
                bodyMass,
                bodyFatPercentage,
                dietaryWater
            ])
            let shareTypes = Set([
                HKObjectType.workoutType()
            ])
            healthStore.requestAuthorization(toShare: shareTypes, read: readTypes, completion: requestAuthorizationResultHandler)
        }
        readHealthCharacteristicTypeData()
        readHealthSampleTypeData()
        readWorkout()
    }
    
    // For testing
    private func readHealthCharacteristicTypeData() {
        // TODO: - Add other data
        UserHealthData.ObjectType.allCases.forEach { type in
            switch type {
            case .biologicalSex:
                do {
                    if let sex = try? healthStore.biologicalSex().biologicalSex {
                        user?.biologicalSex = sex
                        switch sex {
                        case .female: print("female")
                        case .male: print("male")
                        case .other: print("others")
                        case .notSet: print("not set")
                        @unknown default:
                            print("unknown default")
                        }
                    }
                }
            }
        }
    }
    private func readHealthSampleTypeData() {
        UserHealthData.SampleType.allCases.forEach { type in
            if let sampleType = type.toSampleType {
                let query = HKSampleQuery(sampleType: sampleType,
                                          predicate: nil,
                                          limit: HKObjectQueryNoLimit,
                                          sortDescriptors: nil) { _, results, error in
                    if let error = error {
                        ErrorHandler.shared.handle(error)
                    } else {
                        results?.forEach({ result in
                            let date = result.startDate
                            self.healthData[date.toDateTriple]?.updateData(of: type, to: result)
                        })
                    }
                }
                healthStore.execute(query)
            }
        }
    }
    func readWorkout() {
        let workoutPredicate = HKQuery.predicateForWorkouts(with: .other)
        let sourcePredicate = HKQuery.predicateForObjects(from: .default())
        let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [workoutPredicate, sourcePredicate])
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
          
        let query = HKSampleQuery(sampleType: .workoutType(),
                                  predicate: compound,
                                  limit: 0,
                                  sortDescriptors: [sortDescriptor]) { query, samples, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    ErrorHandler.shared.handle(error)
                    return
                }
                guard let samples = samples as? [HKWorkout] else { return }
                self.updateWorkoutData(data: samples)
            }
        }
        healthStore.execute(query)
    }
}
extension UserManager {
    private func updateWorkoutData(data: [HKWorkout]) {
        for workout in data {
            let date = workout.startDate
            self.workoutData[date.toDateTriple, default: []].append(workout)
        }
    }
}
