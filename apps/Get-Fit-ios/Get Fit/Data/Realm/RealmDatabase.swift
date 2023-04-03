//
//  RealmDatabase.swift
//  Get Fit
//
//  Created by Mu Yu on 3/25/23.
//

import Foundation
import Realm
import RealmSwift

class RealmDatabase: DataProvider {
    internal let realm: Realm
    
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    
    internal init(realm: Realm) {
        self.realm = realm
        setup()
    }

    
    struct Attribute {
        static var userID: String { "userID" }
        static var year: String { "year" }
        static var month: String { "month" }
        static var day: String { "day" }
    }
    
    enum RealmError: Error {
        case missingObject
        case snapshotMissing
        case multipleDocumentUsingSameID
        case dataKeyMissing
        case entryInitFailure
        case userMissing
        case documentMissing
        case invalidDocumentID
        case invalidQuery
        case setDataFailure
        case deleteDataFailure
        case dataEncodingError
    }
}

// MARK: - Setup
extension RealmDatabase {
    func setup() {
        // TODO: -
//        try? realm.write {
//            realm.deleteAll()
//        }
//        try? realm.write {
//            workoutData.forEach { workoutSession in
//                let object = workoutSession.managedObject()
//                var session = realm.create(WorkoutSessionObject.self, value: object)
//            }
//        }
    }
}

// MARK: - Generic
extension RealmDatabase {
//    public func add<T: Persistable>(_ value: T, update: UpdatePolicy) {
//        realm.add(value.managedObject(), update: update)
//    }
}

// MARK: - Users
extension RealmDatabase {
    func getUserPreference(for userID: UserID) -> UserPreference? {
        guard let object = realm.objects(UserPreferenceObject.self).where({ $0.userID == userID }).first else {
            return nil
        }
        return UserPreference(managedObject: object)
    }
    
    func getUserProfile(for userID: UserID) -> User? {
        guard let object = realm.objects(UserObject.self).where({ $0.id == userID }).first else {
            return nil
        }
        return User(managedObject: object)
    }
}

// MARK: - Food
extension RealmDatabase {
    func getCustomizedMeals(for userID: UserID) -> [CustomizedMeal] {
        // TODO: -
        return []
    }
    
    func getDailyMealLog(for userID: UserID, on date: Date) -> DailyMealLog? {
        // TODO: -
        return nil
    }
    
    func updateMealLog(for userID: UserID, to value: MealLog) -> VoidResult {
        // TODO: -
        return .success
    }
    
    func removeMealLog(for userID: UserID) -> VoidResult {
        // TODO: -
        return .success
    }
    
    func getPreviousFoodLogs(for userID: UserID) -> [FoodID : FoodLog] {
        // TODO: -
        return [:]
    }
    
    func searchFoods(contain keyword: String) -> [FoodID] {
        // TODO: -
        return []
    }
}

// MARK: - Workout
extension RealmDatabase {
    func getWorkoutRoutines(for userID: UserID) -> [WorkoutRoutine] {
        // TODO: - 
        return WorkoutRoutine.testEntries
    }
    
    func removeWorkoutRoutine(for userID: UserID, at workoutRoutine: WorkoutRoutineID) -> VoidResult {
        // TODO: -
        return .success
    }
    
    func getAllWorkoutSessions(for userID: UserID) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .where({ $0.userID == userID })
            .map({ WorkoutSession(managedObject: $0) })
        return Array(sessions)
    }
    
    func getWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .where({ $0.userID == userID })
            .map({ WorkoutSession(managedObject: $0) })
            .filter({ $0.startTime >= startDate.toDateAndTime && $0.startTime <= endDate.toDateAndTime })
        return Array(sessions)
    }
    
    func getWorkoutSessions(for userID: UserID, on date: YearMonthDay) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .where({ $0.userID == userID })
            .map({ WorkoutSession(managedObject: $0) })
            .filter({ $0.startTime.toYearMonthDay == date || $0.endTime.toYearMonthDay == date })
        return Array(sessions)
    }
    
    func removeWorkoutSession(for userID: UserID, at sessionID: WorkoutSessionID) -> VoidResult {
        guard let object = realm.objects(WorkoutSessionObject.self).where({ $0.id == sessionID }).first else {
            return .failure(RealmError.missingObject)
        }
        do {
            try realm.write({
                realm.delete(object)
            })
            return .success
        } catch {
            return .failure(error)
        }
    }
    
    func updateWorkoutSession(for userID: UserID, _ session: WorkoutSession) -> VoidResult {
        do {
            try realm.write({
                realm.add(session.managedObject(), update: .modified)
            })
            return .success
        } catch {
            return .failure(error)
        }
    }
    
    func getJournal(for userID: UserID, on date: Date) -> [Journal] {
        // TODO: -
        return []
    }
}
