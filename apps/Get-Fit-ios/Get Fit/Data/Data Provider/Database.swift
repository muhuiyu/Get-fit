//
//  Database.swift
//  Why am I so poor
//
//  Created by Mu Yu on 7/4/22.
//

import UIKit
import FirebaseFirestore

class Database: DataProvider {
    internal var workoutSessionsCache = WorkoutSessionsCache()
    
    internal let dailyMealLogRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.dailyMealLogs)
    internal let workoutSessionRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.workoutSessions)
    internal let workoutRoutineRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.workoutRoutines)
    internal let progressRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.progress)
    internal let userPreferenceRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.userPreference)
    internal let usersRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.users)
    
    struct FirebaseCollection {
        static var dailyMealLogs: String { "dailyMealLogs" }
        static var workoutSessions: String { "workoutSessions" }
        static var workoutRoutines: String { "workoutRoutines" }
        static var progress: String { "progress" }
        static var userPreference: String { "userPreference" }
        static var users: String { "users" }
    }
    
    struct Attribute {
        static var userID: String { "userID" }
        static var year: String { "year" }
        static var month: String { "month" }
        static var day: String { "day" }
    }
    
    enum FirebaseError: Error {
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
    
    init() {
        
    }
}
// MARK: - Setup
extension Database {
    func setup() async {
        // connect to remote database
        // establishing connection
        
        print("set up database")
//        writeData()
    }
}
// MARK: - write data
extension Database {
    func writeData() {
        // mealLog
//        for log in DailyMealLog.testEntries {
//            if log.id == "" {
//                do {
//                    let documentRef = try dailyMealLogRef.addDocument(from: log) { error in
//                        if let error = error {
//                            print(error)
//                        }
//                    }
//                    print(log.day)
//                    print(documentRef.documentID)
//                } catch {
//
//                }
//            }
//        }
        // workout log
//        let workoutEntry = WorkoutSession(id: "",
//                                          userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
//                                          startTime: DateAndTime(year: 2022, month: 3, day: 21, hour: 13, minute: 10, second: 0),
//                                          endTime: DateAndTime(year: 2022, month: 3, day: 21, hour: 13, minute: 46, second: 0),
//                                          title: "Full body #1",
//                                          circuits: [
//                                               WorkoutCircuit(type: .singleExercise, sets: [
//                                                   WorkoutSet(itemID: WorkoutItem.legPress.id,
//                                                              type: .normal,
//                                                              weight: 40,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(120),
//                                                              note: "not heavy"),
//                                                   WorkoutSet(itemID: WorkoutItem.legPress.id,
//                                                              type: .normal,
//                                                              weight: 40,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(120),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.legPress.id,
//                                                              type: .normal,
//                                                              weight: 50,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(120),
//                                                              note: "too heavy"),
//                                               ]),
//                                               WorkoutCircuit(type: .superSet, sets: [
//                                                   WorkoutSet(itemID: WorkoutItem.barbellSquat.id,
//                                                              type: .normal,
//                                                              weight: 70,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.dumbbellBenchPress.id,
//                                                              type: .normal,
//                                                              weight: 10,
//                                                              reps: 12,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.barbellSquat.id,
//                                                              type: .normal,
//                                                              weight: 70,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.dumbbellBenchPress.id,
//                                                              type: .normal,
//                                                              weight: 10,
//                                                              reps: 12,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.barbellSquat.id,
//                                                              type: .normal,
//                                                              weight: 70,
//                                                              reps: 15,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                                   WorkoutSet(itemID: WorkoutItem.dumbbellBenchPress.id,
//                                                              type: .normal,
//                                                              weight: 10,
//                                                              reps: 12,
//                                                              restTime: TimeInterval(10),
//                                                              note: ""),
//                                               ]),
//                                          ])
        
//        do {
//            let documentRef = try workoutSessionRef.addDocument(from: workoutEntry) { error in
//                if let error = error {
//                    print(error)
//                }
//            }
//            print(documentRef.documentID)
//        } catch {
//
//        }
    }
}
// MARK: - Users
extension Database {
    internal func fetchUserPreference(for userID: UserID) async -> UserPreference? {
        do {
            let snapshot = try await userPreferenceRef.whereField(Attribute.userID, isEqualTo: userID).getDocuments()
            guard !snapshot.documentChanges.isEmpty else { return nil }
            let userPreference = try? UserPreference(snapshot: snapshot.documentChanges[0].document)
            return userPreference
        } catch {
            return nil
        }
    }
    func fetchUserProfile(for userID: UserID) async -> User? {
//        do {
//            let snapshot = try await usersRef.whereField(Attribute.userID, isEqualTo: userID).getDocuments()
//            guard !snapshot.documentChanges.isEmpty else { return nil }
//            let user = try? User(snapshot: snapshot.documentChanges[0].document)
//            return user
//        } catch {
//            return nil
//        }
        return nil
    }
}
// MARK: - Food set
extension Database {
    func updateMealLog(for userID: UserID, to value: MealLog) async -> VoidResult {
        return .success
    }
    func removeMealLog(for userID: UserID) async -> VoidResult {
        return .success
    }
}
// MARK: - Food Fetch from Database
extension Database {
    func fetchCustomizedMeals(for userID: UserID) async -> [CustomizedMeal] {
        return CustomizedMeal.testEntries
    }
    func fetchDailyMealLog(for userID: UserID, on date: Date) async -> DailyMealLog? {
        do {
            let snapshot = try await dailyMealLogRef
                .whereField(Attribute.userID, isEqualTo: userID)
                .whereField(Attribute.year, isEqualTo: date.year)
                .whereField(Attribute.month, isEqualTo: date.month)
                .whereField(Attribute.day, isEqualTo: date.dayOfMonth)
                .getDocuments()
            guard snapshot.documentChanges.count == 1, snapshot.documentChanges[0].type == .added else {
                return nil
            }
            return try DailyMealLog(snapshot: snapshot.documentChanges[0].document)
        } catch {
            return nil
        }
    }
    func fetchPreviousFoodLogs(for userID: UserID) async -> [FoodID: FoodLog] {
        // TODO: - 
        let loggedFoods = [
            Food.chickenBreast.id: FoodLog(foodID: Food.chickenBreast.id, amount: 500, unit: .gram),
            Food.egg.id: FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
            Food.eggYolk.id: FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
        ]
        return loggedFoods
    }
}
// MARK: - Search Food
extension Database {
    func searchFoods(contain keyword: String) -> [FoodID] {
        return Food.all
            .filter({ $0.value.name.lowercased().contains(keyword.lowercased()) })
            .map({ $0.key })
    }
}
// MARK: - Workout
extension Database {
    func fetchWorkoutRoutines(for userID: UserID) async {
//        return WorkoutRoutine.testEntries
    }
    func removeWorkoutRoutine(for userID: UserID, at workoutRoutine: WorkoutRoutineID) async -> VoidResult {
        return .success
    }
    internal func fetchAllWorkoutSessions(for userID: UserID) async {
        do {
            let snapshot = try await workoutSessionRef
                .whereField(Attribute.userID, isEqualTo: userID)
                .getDocuments()
            let sessions = snapshot.documentChanges.compactMap { try? WorkoutSession(snapshot: $0.document) }
            workoutSessionsCache.updateData(sessions)
        } catch {
            // TODO: - error handle
        }
    }
    internal func fetchWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) async {
        do {
            let snapshot = try await workoutSessionRef
                .whereField(Attribute.userID, isEqualTo: userID)
                .getDocuments()
            let sessions = snapshot.documentChanges
                .compactMap { try? WorkoutSession(snapshot: $0.document) }
                .filter { session in
                    session.startTime >= startDate.toDateAndTime && session.startTime <= endDate.toDateAndTime
                }
            workoutSessionsCache.updateData(sessions)
        } catch {
            // TODO: -
        }
    }
    internal func fetchWorkoutSessions(for userID: UserID, on date: YearMonthDay) async {
        // TODO: - add some check?
//        if workoutSessionsCache.isEmpty {
//
//        }
        do {
            let snapshot = try await workoutSessionRef
                .whereField(Attribute.userID, isEqualTo: userID)
                .getDocuments()
            let sessions = snapshot.documentChanges
                .compactMap { try? WorkoutSession(snapshot: $0.document) }
                .filter { $0.startTime.toYearMonthDay == date || $0.endTime.toYearMonthDay == date }
            workoutSessionsCache.updateData(sessions)
        } catch {
            // TODO: -
        }
    }
    func removeWorkoutSession(for userID: UserID, at sessionID: WorkoutSessionID) async -> VoidResult {
        do {
            try await workoutSessionRef.document(sessionID).delete()
            return .success
        } catch {
            return .failure(FirebaseError.deleteDataFailure)
        }
    }
    func getWorkoutSessions(for userID: UserID, on date: YearMonthDay) async -> [WorkoutSession] {
        await fetchWorkoutSessions(for: userID, on: date)
        return workoutSessionsCache.getSessions(on: date)
    }
    func getAllWorkoutSessions(for userID: UserID) async -> [WorkoutSession] {
        await fetchAllWorkoutSessions(for: userID)
        return workoutSessionsCache.getAllSessions()
    }
    func updateWorkoutSession(for userID: UserID, _ session: WorkoutSession) async -> VoidResult {
        do {
            guard let data = session.dictionary else {
                return .failure(FirebaseError.dataEncodingError)
            }
            try await workoutSessionRef
                .document(session.id)
                .setData(data)
            return .success
        } catch {
            return .failure(FirebaseError.setDataFailure)
        }
    }
}
// MARK: - Journal
extension Database {
    func fetchJournal(for userID: UserID, on date: Date) async -> [Journal] {
        // TODO: -
        return Journal.testEntries.filter { $0.year == date.year && $0.month == date.month && $0.day == date.dayOfMonth }
    }
}


// MARK: - Cache
struct WorkoutSessionsCache {
    var data: [WorkoutSessionID: WorkoutSession]
    var lastUpdatedTime: Date?
    
    init() {
        data = [WorkoutSessionID: WorkoutSession]()
        lastUpdatedTime = nil
    }
    
    var isEmpty: Bool { lastUpdatedTime == nil || data.isEmpty }
    
    mutating func updateData(_ sessions: [WorkoutSession]) {
        lastUpdatedTime = Date()
        sessions.forEach { data[$0.id] = $0 }
    }
    
    func getSessions(on date: YearMonthDay, isSorted: Bool = false) -> [WorkoutSession] {
        if data.isEmpty { return [] }
        return data.values.filter({ $0.startTime.toYearMonthDay == date || $0.endTime.toYearMonthDay == date })
    }
    
    func getAllSessions(isSorted: Bool = false) -> [WorkoutSession] {
        return data.values.map({ $0 })
    }
}
struct DailyMealLogsCache {
    
}
