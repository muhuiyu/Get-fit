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
//        do {
//            let documentRef = try workoutSessionRef.addDocument(from: workoutData[2]) { error in
//                if let error = error {
//                    print(error)
//                }
//            }
//            print(documentRef.documentID)
//        } catch {
//            print(error)
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



let workoutData: [WorkoutSession] = [
        WorkoutSession(id: "",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 8, restTime: TimeInterval(30), note: "standing"),
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 10, reps: 10, restTime: TimeInterval(60), note: "5kg each side"),
                            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
                            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 12.5, reps: 4, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
                        ]),
                       ],
                       note: ""),
        WorkoutSession(id: "",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 12, minute: 0, second: 0),
                       title: "Lower body",
                       circuits: [
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .warmUp, weight: 30, reps: 8, restTime: TimeInterval(60), note: "5kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 50, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 60, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                        ]),
                        WorkoutCircuit(type: .superSet,
                                       sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                       ]),
                       ],
                       note: ""),
        WorkoutSession(id: "",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 12, minute: 0, second: 0),
                       title: "Full body",
                       circuits: [
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                        ]),
                        WorkoutCircuit(type: .superSet, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 12, restTime: TimeInterval(0), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                        ]),
                        WorkoutCircuit(type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                        ]),
                       ],
                       note: ""),
    ]
