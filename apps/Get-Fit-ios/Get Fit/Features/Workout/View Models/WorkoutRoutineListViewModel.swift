//
//  WorkoutRoutineListViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxRelay
import RxSwift

class WorkoutRoutineListViewModel: BaseViewModel {
    lazy var dataSource = WorkoutSessionDataSource.dataSource()
    
    // MARK: - Reactive Properties
    private var routines: BehaviorRelay<[WorkoutRoutine]> = BehaviorRelay(value: [])
    var displayRoutines: BehaviorRelay<[WorkoutRoutineSection]> = BehaviorRelay(value: [])
}

extension WorkoutRoutineListViewModel {
    var titleString: String { AppText.Workout.workoutRoutines }
}

extension WorkoutRoutineListViewModel {
    func reloadData() {
        guard let userID = appCoordinator?.userManager.id else { return }
        if let data = appCoordinator?.dataProvider.getAllWorkoutRoutines(for: userID) {
            self.routines.accept(data)
        }
    }
    func deleteRoutine(at indexPath: IndexPath) {
        // TODO: - 
    }
}

extension WorkoutRoutineListViewModel {
    func getRoutineID(at indexPath: IndexPath) -> WorkoutRoutineID? {
        return routines.value[indexPath.row].id
    }
    func getRoutineTitle(at indexPath: IndexPath) -> String? {
        return routines.value[indexPath.row].title
    }
    func getRoutineSubtitle(at indexPath: IndexPath) -> String? {
        return routines.value[indexPath.row].allItemNames
    }
    func getRoutine(at indexPath: IndexPath) -> WorkoutRoutine? {
        return routines.value[indexPath.row]
    }
}
