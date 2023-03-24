//
//  WorkoutRoutineViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxRelay
import RxSwift

class WorkoutRoutineViewModel {
    private let disposeBag = DisposeBag()
    
    var routine: BehaviorRelay<WorkoutRoutine?> = BehaviorRelay(value: nil)
    var displayTitleString: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    struct Section {
        static let header = 0
        static let itemLogs = 1
        static let addExercise = 2
    }
    
    init() {
        self.routine
            .asObservable()
            .subscribe(onNext: { value in
                if let value = value {
                    self.displayTitleString.accept(value.title)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension WorkoutRoutineViewModel {
//    func getItemLog(at indexPath: IndexPath) -> WorkoutItemLog? {
//        guard
//            let routine = routine.value,
//            !routine.itemLogs.isEmpty,
//            indexPath.section == Section.itemLogs
//        else {
//            return nil
//        }
//        return routine.itemLogs[indexPath.row]
//    }
    func getItem(at indexPath: IndexPath) -> WorkoutItem? {
//        guard
//            let itemLog = getItemLog(at: indexPath),
//            let item = WorkoutItem.getWorkoutItem(of: itemLog.itemID) else { return nil }
//        return item
        return nil
    }
}
extension WorkoutRoutineViewModel {
    func addExercise(for itemID: WorkoutItemID) {
        // TODO: -
        updateRoutineDataToDatabase()
    }
}
// MARK: - Update data
extension WorkoutRoutineViewModel {
    func didChangeTitleValue(to value: String?) {
        guard
            let value = value,
            var updatedRoutine = routine.value else {
            return
        }
        updatedRoutine.title = value
        routine.accept(updatedRoutine)
        updateRoutineDataToDatabase()
    }
    private func updateRoutineDataToDatabase() {
        // TODO: -
    }
}
extension WorkoutRoutineViewModel {
    func determineDestination(at indexPath: IndexPath) -> Destination {
        if indexPath.section == Section.itemLogs {     // items
            return .editItem
        } else if indexPath.section == Section.addExercise && indexPath.row == 0 {    // add exercise
            return .addExercise
        } else {
            return .others
        }
    }
    enum Destination {
        case editItem
        case addExercise
        case others
    }
}

