//
//  DailyMealLog.swift
//  Get Fit
//
//  Created by Mu Yu on 9/5/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

typealias DailyMealLogID = String

struct DailyMealLog: Identifiable, Codable {
    let id: DailyMealLogID
    let userID: UserID
    let year: Int
    let month: Int
    let day: Int
    let mealLogs: [MealLog]
    
    // Firebase
    static var collectionName: String { "mealLogs" }
}
extension DailyMealLog {
    init(userID: UserID, date: Date = Date.today, preferredNumberOfMeals: Int = 3) {
        self.id = ""
        self.userID = userID
        self.year = date.year
        self.month = date.month
        self.day = date.dayOfMonth
        self.mealLogs = [MealLog](repeating: MealLog(hour: 0,
                                                     minute: 0,
                                                     foodLogs: [FoodLog]()),
                                  count: preferredNumberOfMeals)
    }
}

// MARK: - Interface
extension DailyMealLog {
    var totalCalories: Int { mealLogs.totalCalories }
    func getTotalGram(for item: MacroItem) -> Double {
        switch item {
        case .carbs:
            return mealLogs.map { $0.totalCarbs }.reduce(0, +)
        case .protein:
            return mealLogs.map { $0.totalProtein }.reduce(0, +)
        case .fat:
            return mealLogs.map { $0.totalFat }.reduce(0, +)
        }
    }
}

// MARK: - Firebase
extension DailyMealLog {
    private struct DailyMealLogData: Codable {
        let userID: UserID
        let year: Int
        let month: Int
        let day: Int
        let mealLogs: [MealLog]
        
        private enum CodingKeys: String, CodingKey {
            case userID
            case year
            case month
            case day
            case mealLogs
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            userID = try container.decode(UserID.self, forKey: .userID)
            year = try container.decode(Int.self, forKey: .year)
            month = try container.decode(Int.self, forKey: .month)
            day = try container.decode(Int.self, forKey: .day)
            mealLogs = try container.decode([MealLog].self, forKey: .mealLogs)
        }
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(userID, forKey: .userID)
            try container.encode(year, forKey: .year)
            try container.encode(month, forKey: .month)
            try container.encode(day, forKey: .day)
            try container.encode(mealLogs, forKey: .mealLogs)
        }
    }
    init(snapshot: DocumentSnapshot) throws {
        id = snapshot.documentID
        let data = try snapshot.data(as: DailyMealLogData.self)
        userID = data.userID
        year = data.year
        month = data.month
        day = data.day
        mealLogs = data.mealLogs
    }
}
