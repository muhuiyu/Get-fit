//
//  Database.swift
//  Why am I so poor
//
//  Created by Mu Yu on 7/4/22.
//

import UIKit
//import Firebase

public enum VoidResult {
    case success
    case failure(Error)
}

class Database {
    static let shared = Database()
    
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
    
    struct Collections {
        static let transactions = "transactions"
        static let recurringTransactions = "recurringTransactions"
        static let budgets = "budgets"
        static let merchants = "merchants"
        static let notifications = "notifications"
    }
    
    struct FieldNames {
        static let year = "year"
        static let month = "month"
        static let day = "day"
        static let userID = "userID"
        static let categoryID = "categoryID"
        static let amount = "amount"
        static let value = "value"
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
        setup()
    }
}
// MARK: - Setup
extension Database {
    private func setup() {
        // TODO: -
        updateUserManager()
    }
    private func updateUserManager() {
        let testEmail = "muyuhello@gmail.com"
        UserManager.shared.setUserEmail(to: testEmail)
    }
}
