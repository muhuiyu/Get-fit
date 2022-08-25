//
//  WorkoutCoordinator.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import UIKit

class WorkoutCoordinator: BaseCoordinator {
    enum Destination {
        case viewSessionLog(WorkoutSession)
        case viewWorkoutRoutineList
        case viewWorkoutRoutine(WorkoutRoutine)
        case viewCreateRoutine
        case editItemLog(WorkoutItemLog)
        case selectFromExerciseList(WorkoutSessionViewModel?, WorkoutRoutineViewModel?)
    }
}

// MARK: - ViewController List
extension WorkoutCoordinator {
    private func makeViewController(for destination: Destination) -> ViewController? {
        switch destination {
        case .viewSessionLog(let session):
            let viewController = WorkoutSessionViewController()
            viewController.workoutCoordinator = self
            viewController.viewModel.session.accept(session)
            return viewController
        case .viewWorkoutRoutineList:
            let viewController = WorkoutRoutineListViewController()
            viewController.workoutCoordinator = self
            return viewController
        case .viewWorkoutRoutine(let routine):
            let viewController = WorkoutRoutineViewController()
            viewController.workoutCoordinator = self
            viewController.viewModel.routine.accept(routine)
            return viewController
        case .viewCreateRoutine:
            let viewController = WorkoutRoutineViewController()
            viewController.workoutCoordinator = self
            viewController.viewModel.routine.accept(WorkoutRoutine())
            return viewController
        case .editItemLog(let itemLog):
            // TODO: -
            return BaseViewController()
        case .selectFromExerciseList(let workoutSessionViewModel, let workoutRoutineViewModel):
            let viewController = WorkoutExerciseListViewController(workoutCoordinator: self,
                                                                   routineViewModel: workoutRoutineViewModel,
                                                                   sessionViewModel: workoutSessionViewModel)
            return viewController
        }
    }
}

// MARK: - Navigation
extension WorkoutCoordinator {
    func showSessionLog(for session: WorkoutSession) {
        guard let viewController = makeViewController(for: .viewSessionLog(session)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showWorkoutRoutineList() {
        guard let viewController = makeViewController(for: .viewWorkoutRoutineList) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showWorkoutRoutine(for routine: WorkoutRoutine) {
        guard let viewController = makeViewController(for: .viewWorkoutRoutine(routine)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showCreateRoutine() {
        guard let viewController = makeViewController(for: .viewCreateRoutine) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showItemLogDetails(for itemlog: WorkoutItemLog) {
        guard let viewController = makeViewController(for: .editItemLog(itemlog)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showExerciseList(routineViewModel: WorkoutRoutineViewModel? = nil,
                          sessionViewModel: WorkoutSessionViewModel? = nil) {
        guard let viewController = makeViewController(for: .selectFromExerciseList(sessionViewModel,
                                                                                   routineViewModel)) else { return }
        let options = ModalOptions(isEmbedInNavigationController: true, isModalInPresentation: true)
        self.navigate(to: viewController, presentModally: true, options: options)
    }
}
