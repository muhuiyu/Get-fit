//
//  AppText.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import Foundation

struct AppText {
    static var appName: String { "Get Fit" }
}

extension AppText {
    struct General {
        static var add: String { "Add" }
        static var save: String { "Save" }
        static var cancel: String { "Cancel" }
        static var delete: String { "Delete" }
        static var share: String { "Share" }
        static var search: String { "Search" }
        static var pullToRefresh: String { "Pull to refresh" }
        static var goal: String { "Goal" }
        static var noData: String { "No data" }
    }
}
// MARK: - Loading and Auth
extension AppText {
    struct Loading {
        static var title: String { "Loading" }
    }
    struct Auth {
        static var continueWithGoogle: String { "Continue with Google" }
    }
}
// MARK: - Main Tab
extension AppText {
    struct MainTab {
        static var home: String { "Home" }
        static var workout: String { "Workout" }
        static var progress: String { "Progress" }
        static var me: String { "Me" }
    }
}
// MARK: - Home
extension AppText {
    struct Home {
        static var title: String { "Diary" }
        static var activeCaloriesTitle: String { "Burned" }
        static var activeCaloriesSubtitle: String { "active calories" }
        static var dailyStepsTitle: String { "Steps" }
        static var dailyStepsSubtitle: String { "Daily steps" }
        static var sleepHoursTitle: String { "Sleep" }
        static var sleepHoursSubtitle: String { "sleep hours" }
        static var waterIntakeTitle: String { "Water" }
        static var waterIntakeSubtitle: String { "water intake" }
        static var remaining: String { "Remaining" }
        static var consumed: String { "Consumed" }
        static var addFoodLog: String { "Add food" }
        static var addMeal: String { "Add meal" }
        static var editMeal: String { "Edit" }
        static var addJournal: String { "Add journal" }
        static var noData: String { "No data" }
        static var exercise: String { "Exercise" }
        static var journal: String { "Journal" }
    }
}
// MARK: - Unit
extension AppText {
    struct Unit {
        static var kcal: String { "kcal" }
        static var steps: String { "steps" }
        static var hours: String { "hours" }
        static var mililiter: String { "mL" }
        static var liter: String { "L" }
        static var day: String { "day" }
        static var days: String { "days" }
        static var minutes: String { "minutes" }
        static var minuteShort: String { "min" }
        static var kg: String { "kg" }
        static var g: String { "g" }
        static var oz: String { "oz" }
        static var lb: String { "lb" }
    }
}
// MARK: - Workout
extension AppText {
    struct Workout {
        static var settings: String { "Settings" }
        static var newSession: String { "New Session" }
        static var workoutRoutine: String { "Workout Routine" }
        static var workoutRoutines: String { "Workout Routines" }
        static var startTime: String { "Start Time" }
        static var endTime: String { "End Time" }
        static var note: String { "Note" }
        static var editNote: String { "Edit Note" }
        static var move: String { "Move" }
        static var editExercise: String { "Edit Exercise" }
        static var editCategory: String { "Edit Category" }
        static var editRoutine: String { "Edit Routine" }
        static var addExercise: String { "Add Exercise" }
        static var addSuperSet: String { "Add Super Set" }
        static var addCircuit: String { "Add Circuit" }
        static var addSpecialSet: String { "Add Special Set" }
        static var startThisRoutine: String { "Start this routine" }
        static var addSet: String { "Add Set" }
        static var weight: String { "Weight" }
        static var reps: String { "Reps" }
        static var selectExercise: String { "Select Exercise" }
        static var warmUp: String { "Warm up" }
        static var dropSet: String { "Drop set" }
        static var normal: String { "Normal" }
        static var reorderCircuits: String { "Reorder Circuits" }
        static var SaveAsRoutine: String { "Save as Routine" }
        static var superSet: String { "Super Set" }
        static var circuit: String { "Circuit" }
        static var history: String { "History" }
        static var info: String { "Info" }
    }
}
// MARK: - Me
extension AppText {
    struct Me {
        static var account: String { "Account" }
        static var generalSettings: String { "General Settings" }
        static var goals: String { "Goals" }
        static var reminders: String { "Reminders" }
        static var appAndDevices: String { "App and Devices" }
        static var customization: String { "Customization" }
        static var editExercises: String { "Edit Exercises" }
        static var editMeals: String { "Edit Meals" }
        static var editRecipes: String { "Edit Recipes" }
        static var feedback: String { "Feedback" }
        static var sendFeedback: String { "Send Feedback" }
        static var helpAndSupport: String { "Help and Support" }
        static var sync: String { "Sync" }
        static var signedInAs: String { "SignedInAs" }
        static var syncFooterTitle: String { "Data is synced automatically when finishing a workout." }
        static var signOut: String { "Sign Out" }
        static var deleteMyAccount: String { "Delete My Account" }
        static var startingWeight: String { "Starting Weight" }
        static var currentWeight: String { "Current Weight" }
        static var goalWeight: String { "Goal Weight" }
        static var weeklyGoal: String { "Weekly Goal" }
        static var activityLevel: String { "Activity Level" }
        static var nutritionGoals: String { "Nutrition Goals" }
        static var caloriesAndMacroGoalsTitle: String { "Calories and Macro Goals" }
        static var caloriesAndMacroGoalsSubtitle: String { "Customize your default or daily goals." }
        static var additionalNutrientGoals: String { "Addtional Nutrient Goals" }
        static var fitnessGoals: String { "Fitness Goals" }
    }
}
