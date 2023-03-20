//
//  HomeViewModel.swift
//  Why am I so poor
//
//  Created by Mu Yu on 6/25/22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class HomeViewModel: BaseViewModel {
    // MARK: - Reactive Properties
    var currentDate: BehaviorRelay<Date> = BehaviorRelay(value: Date())
    var dailyMealLog: BehaviorRelay<DailyMealLog?> = BehaviorRelay(value: nil)

    override init() {
        super.init()
        configureSignals()
    }
}
extension HomeViewModel {
    var startIndexOfMealSections: Int { return 2 }
    var endIndexOfMealSections: Int {
        guard let mealLogs = dailyMealLog.value?.mealLogs else { return 0 }
        return 2 + mealLogs.count - 1
    }
    var indexOfExerciseSection: Int { return endIndexOfMealSections + 1 }
    var indexOfJournalSection: Int { return endIndexOfMealSections + 2 }
    func isDateControlCell(at indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 && indexPath.row == 0
    }
}

// MARK: - Interface
extension HomeViewModel {
    func reloadDailyLog(shouldPull: Bool = true) {
        guard let userID = appCoordinator?.userManager.id else { return }
        Task {
            if let entry = await appCoordinator?.dataProvider.fetchDailyMealLog(for: userID, on: currentDate.value) {
                self.dailyMealLog.accept(entry)
            } else {
                if let preferredNumberOfMeals = appCoordinator?.userManager.preferredNumberOfMeals {
                    self.dailyMealLog.accept(DailyMealLog(userID: userID,
                                                          date: currentDate.value,
                                                          preferredNumberOfMeals: preferredNumberOfMeals))
                } else {
                    self.dailyMealLog.accept(DailyMealLog(userID: userID,
                                                          date: currentDate.value))
                }
            }
        }
    }
    func getCaloriesUnitConfiguration() -> IconTitleSubtitleNumberUnitView.Configuration {
        let date = currentDate.value
        let activeCalories: Int = appCoordinator?.userManager.activeEnergyBurned(on: date) ?? 0
        let totalCaloriesBurned: Int = appCoordinator?.userManager.totalEnergyBurned(on: date) ?? 0
        let configuration = IconTitleSubtitleNumberUnitView.Configuration(icon: UIImage(systemName: Icons.flameFill),
                                                                          title: AppText.Home.activeCaloriesTitle,
                                                                          subtitle: AppText.Home.activeCaloriesSubtitle,
                                                                          numberString: String(activeCalories),
                                                                          numberStringColor: .systemRed,
                                                                          unitString: AppText.Unit.kcal,
                                                                          noteString: "Total \(String(totalCaloriesBurned)) \(AppText.Unit.kcal)")
        return configuration
    }
    func getStepCountUnitConfiguration() -> IconTitleSubtitleNumberUnitView.Configuration {
        let date = currentDate.value
        let stepCount = appCoordinator?.userManager.stepCount(on: date) ?? 0
        let stepCountGoal = appCoordinator?.userManager.stepCountGoal ?? 0
        let configuration = IconTitleSubtitleNumberUnitView.Configuration(icon: UIImage(systemName: Icons.figureWalk),
                                                                          title: AppText.Home.dailyStepsTitle,
                                                                          subtitle: AppText.Home.dailyStepsSubtitle,
                                                                          numberString: String(stepCount),
                                                                          numberStringColor: .systemGreen,
                                                                          unitString: AppText.Unit.steps,
                                                                          noteString: "\(AppText.General.goal): \(String(stepCountGoal)) \(AppText.Unit.steps)")
        return configuration
    }
    func getSleepHoursUnitConfiguration() -> IconTitleSubtitleNumberUnitView.Configuration {
        let date = currentDate.value
        let sleepHours = appCoordinator?.userManager.sleepHours(on: date) ?? 0
        let sleepHoursGoal = appCoordinator?.userManager.sleepHoursGoal ?? 0
        let configuration = IconTitleSubtitleNumberUnitView.Configuration(icon: UIImage(systemName: Icons.bedDoubleFill),
                                                                          title: AppText.Home.sleepHoursTitle,
                                                                          subtitle: AppText.Home.sleepHoursSubtitle,
                                                                          numberString: String(sleepHours),
                                                                          numberStringColor: .systemPurple,
                                                                          unitString: AppText.Unit.hours,
                                                                          noteString: "\(AppText.General.goal): \(String(sleepHoursGoal)) \(AppText.Unit.hours)")
        return configuration
    }
    func getWaterIntakeConfiguration() -> IconTitleSubtitleNumberUnitView.Configuration {
        let date = currentDate.value
        let dietaryWater = appCoordinator?.userManager.dietaryWater(on: date) ?? 0
        let waterIntakeGoal = appCoordinator?.userManager.waterIntakeGoal ?? 0
        let configuration = IconTitleSubtitleNumberUnitView.Configuration(icon: UIImage(systemName: Icons.dropFill),
                                                                          title: AppText.Home.waterIntakeTitle,
                                                                          subtitle: AppText.Home.waterIntakeSubtitle,
                                                                          numberString: String(dietaryWater),
                                                                          numberStringColor: .systemTeal,
                                                                          unitString: AppText.Unit.liter,
                                                                          noteString: "\(AppText.General.goal): \(String(waterIntakeGoal)) \(AppText.Unit.liter)")
        return configuration
    }
    func getWorkouts() -> [HealthKitWorkout] {
        if let workouts = appCoordinator?.userManager.workout(on: currentDate.value) {
            return workouts.compactMap { workout in
                guard let activityType = HealthKitWorkout.getActivityName(from: workout.workoutActivityType),
                      let calories = workout.totalEnergyBurned?.doubleValue(for: .smallCalorie()) else { return nil }
                
                return HealthKitWorkout(name: activityType,
                                        minutes: workout.duration.minute,
                                        calories: Int(calories))
            }
        } else {
            return []
        }
    }
    var macroRatio: MacroRatio {
        return mealLogs.macroRatio
    }
    var mealLogs: [MealLog] {
        return dailyMealLog.value?.mealLogs ?? []
    }
    var dailyTotalCalories: Int {
        return dailyMealLog.value?.totalCalories ?? 0
    }
    func getMealMacroString(at section: Int) -> String {
        guard
            let mealLogs = dailyMealLog.value?.mealLogs,
            section >= startIndexOfMealSections else {
            return ""
        }
        return mealLogs[section-startIndexOfMealSections].macroStringInGram
    }
    func getMealCalories(at section: Int) -> Int {
        guard
            let mealLogs = dailyMealLog.value?.mealLogs,
            section >= startIndexOfMealSections else {
            return 0
        }
        return mealLogs[section-startIndexOfMealSections].totalCalories
    }
    func getDailyTotalGram(for item: MacroItem) -> Double {
        guard let dailyMealLog = dailyMealLog.value else { return 0 }
        return dailyMealLog.getTotalGram(for: item)
    }
    func getMacroGramGoal(for item: MacroItem) -> Double {
        return appCoordinator?.userManager.getMacroGramGoal(for: item) ?? 0
    }
    var dailyDietaryCaloriesGoal: Int {
        return appCoordinator?.userManager.dailyDietaryCaloriesGoal ?? 0
    }
    func getSummaryMacroString(for item: MacroItem) -> String {
        return "\(String(Int(getDailyTotalGram(for: item)))) / \(String(Int(getMacroGramGoal(for: item)))) g"
    }
}
// MARK: - AppText
extension HomeViewModel {
    var displayTitle: String { AppText.Home.title }
    var displayRefreshControlString: String { AppText.General.pullToRefresh }
}
// MARK: - Configuration
extension HomeViewModel {
    private func configureSignals() {
        currentDate
            .asObservable()
            .subscribe { _ in
                self.reloadDailyLog(shouldPull: true)
            }
            .disposed(by: disposeBag)
    }
}
