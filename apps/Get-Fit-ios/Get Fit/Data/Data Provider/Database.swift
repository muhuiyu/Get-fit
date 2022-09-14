//
//  Database.swift
//  Why am I so poor
//
//  Created by Mu Yu on 7/4/22.
//

import UIKit
import FirebaseFirestore

class Database: DataProvider {
    
//    internal var cachedTransactions = [TransactionID: Transaction]()
//    internal var cachedRecurringTransactions = [RecurringTransactionID: RecurringTransaction]()
//    internal var cachedBudgets = [BudgetID: Budget]()
//    internal var currencyDictionary = [CurrencyCode: Currency]()
//
//    internal var merchantList = [MerchantID: Merchant]()
    
    internal let dailyMealLogRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.dailyMealLogs)
    internal let workoutSessionRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.workoutSessions)
    internal let workoutRoutineRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.workoutRoutines)
    internal let progressRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.progress)
    internal let userPreferenceRef: CollectionReference = Firestore.firestore().collection(FirebaseCollection.userPreference)
    
    struct FirebaseCollection {
        static let dailyMealLogs = "dailyMealLogs"
        static let workoutSessions = "workoutSessions"
        static let workoutRoutines = "workoutRoutines"
        static let progress = "progress"
        static let userPreference = "userPreference"
    }
    
    struct Attribute {
        static let userID = "userID"
        static let year = "year"
        static let month = "month"
        static let day = "day"
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
        writeData()
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
    }
}
// MARK: - Users
extension Database {
    internal func fetchUserPreference(for userID: UserID) async -> UserPreference? {
        do {
            let snapshot = try await userPreferenceRef.whereField(Attribute.userID, isEqualTo: userID).getDocuments()
            let userPreference = try? UserPreference(snapshot: snapshot.documentChanges[0].document)
            return userPreference
        } catch {
            return nil
        }
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
    func searchFoods(contain keyword: String) async -> [FoodID] {
        // TODO: - Connect to database
        return Food.getItemIDs(contain: keyword)
    }
}
// MARK: - Workout
extension Database {
    func fetchWorkoutRoutines(for userID: UserID) async -> [WorkoutRoutine] {
        return WorkoutRoutine.testEntries
    }
    func removeWorkoutRoutine(for userID: UserID, at workoutRoutine: WorkoutRoutineID) async -> VoidResult {
        return .success
    }
    func fetchAllWorkoutSessions(for userID: UserID) async -> [WorkoutSession] {
        return WorkoutSession.testEntries
    }
    func fetchWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) async -> [WorkoutSession] {
        return WorkoutSession.testEntries
    }
    func removeWorkoutSession(for userID: UserID, at workoutSession: WorkoutSessionID) async -> VoidResult {
        return .success
    }
    func getWorkoutSessions(on date: DateTriple) -> [WorkoutSession] {
        // TODO: - connect to real data
        return WorkoutSession.testEntries
    }
    func getAllWorkoutSessions() -> [WorkoutSession] {
        return WorkoutSession.testEntries
    }
}
// MARK: - Journal
extension Database {
    func fetchJournal(for userID: UserID, on date: Date) async -> [Journal] {
        return Journal.testEntries.filter { $0.year == date.year && $0.month == date.month && $0.day == date.dayOfMonth }
    }
}
