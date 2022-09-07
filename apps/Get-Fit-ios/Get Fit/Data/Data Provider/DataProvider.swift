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
//    func fetchCurrentUser() async -> User?
    
    // Food, Database
    func fetchCustomizedMeals(for userID: UserID) async -> [CustomizedMeal]
    func fetchMealLogs(for userID: UserID, on date: Date) async -> [MealLog]
    func updateMealLog(for userID: UserID, to value: MealLog) async -> VoidResult
    func removeMealLog(for userID: UserID) async -> VoidResult
    func fetchLoggedFood(for userID: UserID) async -> [FoodID: FoodLog]
    
    // Search
    // func searchFoods(contain keyword: String) async -> [FoodID]
    
    // Workout
    func fetchWorkoutRoutines(for userID: UserID) async -> [WorkoutRoutine]
    func removeWorkoutRoutine(for userID: UserID, at workoutRoutine: WorkoutRoutineID) async -> VoidResult
    func fetchAllWorkoutSessions(for userID: UserID) async -> [WorkoutSession]
    func fetchWorkoutSessions(for userID: UserID, from startDate: Date, to endDate: Date) async -> [WorkoutSession]
    func removeWorkoutSession(for userID: UserID, at workoutSession: WorkoutSessionID) async -> VoidResult
    
    // Journal
    func fetchJournal(for userID: UserID, on date: Date) async -> [Journal]
}
