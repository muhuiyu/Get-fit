//
//  DataProvider.swift
//  Get Fit
//
//  Created by Mu Yu on 8/27/22.
//

import Foundation

protocol DataProvider {
    // Set up
    func setup() async
    
    // User
    func fetchUserPreference(for userID: UserID) async -> UserPreference?
    func fetchUserProfile(for userID: UserID) async -> User?
    
    // Food, Database
    func fetchCustomizedMeals(for userID: UserID) async -> [CustomizedMeal]
    func fetchDailyMealLog(for userID: UserID, on date: Date) async -> DailyMealLog?
    func updateMealLog(for userID: UserID, to value: MealLog) async -> VoidResult
    func removeMealLog(for userID: UserID) async -> VoidResult
    func fetchPreviousFoodLogs(for userID: UserID) async -> [FoodID: FoodLog]
    
    // Search
    func searchFoods(contain keyword: String) -> [FoodID]
    
    // Workout
    func fetchWorkoutRoutines(for userID: UserID) async
    func removeWorkoutRoutine(for userID: UserID, at workoutRoutine: WorkoutRoutineID) async -> VoidResult
    func fetchAllWorkoutSessions(for userID: UserID) async
    func fetchWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) async
    func getWorkoutSessions(for userID: UserID, on date: YearMonthDay) async -> [WorkoutSession]
    func getAllWorkoutSessions(for userID: UserID) async -> [WorkoutSession]
    func removeWorkoutSession(for userID: UserID, at sessionID: WorkoutSessionID) async -> VoidResult
    func updateWorkoutSession(for userID: UserID, _ session: WorkoutSession) async -> VoidResult
    
    // Journal
    func fetchJournal(for userID: UserID, on date: Date) async -> [Journal]
}
