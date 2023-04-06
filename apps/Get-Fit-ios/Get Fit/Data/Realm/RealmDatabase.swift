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
        try? realm.write {
            realm.deleteAll()
        }
        try? realm.write {
            workoutSessionData.forEach { item in
                let object = item.managedObject()
                let _ = realm.create(WorkoutSessionObject.self, value: object)
            }
            workoutCircuitData.forEach { item in
                let object = item.managedObject()
                let _ = realm.create(WorkoutCircuitObject.self, value: object)
            }
        }
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
    
    func getWorkoutCircuits(_ ids: [WorkoutCircuitID]) -> [WorkoutCircuit] {
        let items = realm.objects(WorkoutCircuitObject.self)
            .filter({ ids.contains($0.id) })
            .map({ WorkoutCircuit(managedObject: $0) })
        return Array(items)
    }
    
    func getAllWorkoutSessions(for userID: UserID) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .filter({ $0.userID == userID })
            .map({ session in
                let circuits = self.getWorkoutCircuits(Array(session.circuits))
                return WorkoutSession(managedObject: session, circuits: circuits)
            })
        return Array(sessions)
    }
    
    func getWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .filter({ $0.userID == userID })
            .filter({ session in
                guard let startTimeObject = session.startTime else { return false }
                let startTime = DateAndTime(managedObject: startTimeObject)
                return startTime >= startDate.toDateAndTime && startTime <= endDate.toDateAndTime
            })
            .map({ session in
                let circuits = self.getWorkoutCircuits(Array(session.circuits))
                return WorkoutSession(managedObject: session, circuits: circuits)
            })
        return Array(sessions)
    }
    
    func getWorkoutSessions(for userID: UserID, on date: YearMonthDay) -> [WorkoutSession] {
        let sessions = realm.objects(WorkoutSessionObject.self)
            .filter({ $0.userID == userID })
            .filter({ session in
                guard let startTimeObject = session.startTime, let endTimeObject = session.endTime else { return false }
                let startTime = DateAndTime(managedObject: startTimeObject)
                let endTime = DateAndTime(managedObject: endTimeObject)
                return startTime.toYearMonthDay == date || endTime.toYearMonthDay == date
            })
            .map({ session in
                let circuits = self.getWorkoutCircuits(Array(session.circuits))
                return WorkoutSession(managedObject: session, circuits: circuits)
            })
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
                session.circuits.forEach({ realm.add($0.managedObject(), update: .modified) })
            })
            return .success
        } catch {
            return .failure(error)
        }
    }
    
    func fetchHistory(for userID: UserID, for circuit: WorkoutCircuit) -> [WorkoutCircuit] {
        let items = realm.objects(WorkoutCircuitObject.self)
            .map({ WorkoutCircuit(managedObject: $0) })
            .filter { item in
                return item.type == circuit.type && item.workoutItems == circuit.workoutItems
            }
        return Array(items)
    }
    
    func getJournal(for userID: UserID, on date: Date) -> [Journal] {
        // TODO: -
        return []
    }
}
