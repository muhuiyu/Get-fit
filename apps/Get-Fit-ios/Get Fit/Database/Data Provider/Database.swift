//
//  Database.swift
//  Why am I so poor
//
//  Created by Mu Yu on 7/4/22.
//

import UIKit
import Firebase

class Database: DataProvider {
    
//    internal var cachedTransactions = [TransactionID: Transaction]()
//    internal var cachedRecurringTransactions = [RecurringTransactionID: RecurringTransaction]()
//    internal var cachedBudgets = [BudgetID: Budget]()
//    internal var currencyDictionary = [CurrencyCode: Currency]()
//
//    internal var merchantList = [MerchantID: Merchant]()
//    internal let transactionRef: CollectionReference = Firestore.firestore().collection(Collections.transactions)
//    internal let recurringTransactionRef: CollectionReference = Firestore.firestore().collection(Collections.recurringTransactions)
//    internal let budgetRef: CollectionReference = Firestore.firestore().collection(Collections.budgets)
//    internal let merchantRef: CollectionReference = Firestore.firestore().collection(Collections.merchants)
//    internal let notificationRef: CollectionReference = Firestore.firestore().collection(Collections.notifications)
    
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
    }
}
// MARK: - Users
extension Database {
    internal func fetchCurrentUser() async -> User? {
        // TODO: - connect to database
        return User.testUser
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
    func fetchMealLogs(for userID: UserID, on date: Date) async -> [MealLog] {
        return MealLog.testEntries.filter { $0.date == date.toDateTriple }.sorted(by: { $0.id < $1.id } )
    }
    func fetchLoggedFood(for userID: UserID) async -> [FoodID: FoodLog] {
        let loggedFoods = [
            Food.chickenBreast.id: FoodLog(foodID: Food.chickenBreast.id, amount: 500, unit: .gram),
            Food.egg.id: FoodLog(foodID: Food.egg.id, amount: 5, unit: .each),
            Food.eggYolk.id: FoodLog(foodID: Food.eggYolk.id, amount: 2, unit: .each),
        ]
        return loggedFoods
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
