//
//  WorkoutCoordinator.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import UIKit

class WorkoutCoordinator: BaseCoordinator {
    enum Destination {
        case session(WorkoutSession)
        case newSession(WorkoutSession)
        case workoutRoutineList
        case workoutRoutine(WorkoutRoutine)
        case workoutRoutinePreview(WorkoutRoutine)
        case createRoutine
        case editCircuit(WorkoutCircuit)
        case selectFromExerciseList(WorkoutSessionViewModel?, WorkoutRoutineViewModel?, WorkoutCircuitType)
        case settings
        case settingsEditExercise
        case settingsEditCategory
        case settingsEditRoutine
        case workoutItemHistory(WorkoutItem)
    }
}

// MARK: - ViewController List
extension WorkoutCoordinator {
    private func makeViewController(to destination: Destination) -> ViewController? {
        switch destination {
        case .session(let session):
            let viewController = WorkoutSessionViewController(appCoordinator: parentCoordinator,
                                                              coordinator: self,
                                                              viewModel: WorkoutSessionViewModel(appCoordinator: parentCoordinator))
            viewController.viewModel.session.accept(session)
            return viewController
        case .newSession(let session):
            let viewController = WorkoutSessionViewController(appCoordinator: parentCoordinator,
                                                              coordinator: self,
                                                              viewModel: WorkoutSessionViewModel(appCoordinator: parentCoordinator),
                                                              isNewSession: true)
            viewController.viewModel.session.accept(session)
            return viewController
        case .workoutRoutineList:
            let viewController = WorkoutRoutineListViewController(appCoordinator: parentCoordinator,
                                                                  coordinator: self,
                                                                  viewModel: WorkoutRoutineListViewModel(appCoordinator: parentCoordinator))
            return viewController
        case .workoutRoutine(let routine):
            let viewController = WorkoutRoutineViewController(appCoordinator: parentCoordinator,
                                                              coordinator: self,
                                                              viewModel: WorkoutRoutineViewModel(appCoordinator: parentCoordinator))
            viewController.viewModel.routine.accept(routine)
            return viewController
        case .workoutRoutinePreview(let routine):
            let viewController = WorkoutRoutinePreviewViewController(appCoordinator: parentCoordinator,
                                                                     coordinator: self,
                                                                     viewModel: WorkoutRoutineViewModel(appCoordinator: parentCoordinator))
            viewController.viewModel.routine.accept(routine)
            return viewController
        case .createRoutine:
            let viewController = WorkoutRoutineViewController(appCoordinator: parentCoordinator,
                                                              coordinator: self,
                                                              viewModel: WorkoutRoutineViewModel(appCoordinator: parentCoordinator))
            if let userID = parentCoordinator?.userManager.id {
                viewController.viewModel.routine.accept(WorkoutRoutine(userID: userID))
            }
            return viewController
        case .editCircuit(let circuit):
            // TODO: -
            return BaseViewController()
        case .selectFromExerciseList(let workoutSessionViewModel, let workoutRoutineViewModel, let circuitType):
            let viewController = WorkoutExerciseListViewController(appCoordinator: parentCoordinator,
                                                                   coordinator: self,
                                                                   routineViewModel: workoutRoutineViewModel,
                                                                   sessionViewModel: workoutSessionViewModel,
                                                                   circuitType: circuitType)
            return viewController
        case .settings:
            let viewController = WorkoutSettingsViewController(appCoordinator: parentCoordinator,
                                                               coordinator: self,
                                                               viewModel: WorkoutSettingsViewModel(appCoordinator: parentCoordinator))
            return viewController
        case .settingsEditExercise:
            // TODO: -
            return BaseViewController()
        case .settingsEditCategory:
            // TODO: -
            return BaseViewController()
        case .settingsEditRoutine:
            // TODO: -
            return BaseViewController()
        case .workoutItemHistory(let item):
            // TODO: -
            return BaseViewController()
        }
    }
}

// MARK: - Navigation
extension WorkoutCoordinator {
    func showSessionLog(for session: WorkoutSession) {
        guard let viewController = makeViewController(to: .session(session)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showNewSession(for userID: UserID, preferredWorkoutLength: TimeInterval) {
        let session = WorkoutSession(userID: userID, preferredWorkoutLength: preferredWorkoutLength)
        guard let viewController = makeViewController(to: .newSession(session)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showWorkoutRoutineList() {
        guard let viewController = makeViewController(to: .workoutRoutineList) else { return }
        let options = ModalOptions(isEmbedInNavigationController: true,
                                   modalPresentationStyle: .overFullScreen,
                                   isModalInPresentation: true)
        self.navigate(to: viewController, presentModally: true, options: options)
    }
    func showWorkoutRoutinePreview(for routine: WorkoutRoutine) {
        guard let viewController = makeViewController(to: .workoutRoutinePreview(routine)) else { return }
        let options = ModalOptions(isEmbedInNavigationController: false,
                                   modalPresentationStyle: .fullScreen,
                                   isModalInPresentation: false)
        self.navigate(to: viewController, presentModally: true, options: options)
    }
    func showWorkoutRoutine(for routine: WorkoutRoutine) {
        guard let viewController = makeViewController(to: .workoutRoutine(routine)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showCreateRoutine() {
        guard let viewController = makeViewController(to: .createRoutine) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showCircuitDetails(for circuit: WorkoutCircuit) {
        guard let viewController = makeViewController(to: .editCircuit(circuit)) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showWorkoutItemHistory(for item: WorkoutItem) {
        guard let viewController = makeViewController(to: .workoutItemHistory(item)) else { return }
        self.navigate(to: viewController, presentModally: true)
    }
    func showExerciseList(routineViewModel: WorkoutRoutineViewModel? = nil,
                          sessionViewModel: WorkoutSessionViewModel? = nil,
                          circuitType: WorkoutCircuitType = .singleExercise) {
        guard let viewController = makeViewController(to: .selectFromExerciseList(sessionViewModel,
                                                                                   routineViewModel,
                                                                                   circuitType)) else { return }
        let options = ModalOptions(isEmbedInNavigationController: true, isModalInPresentation: true)
        self.navigate(to: viewController, presentModally: true, options: options)
    }
    func showSettings() {
        guard let viewController = makeViewController(to: .settings) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showSettingsEditExercise() {
        guard let viewController = makeViewController(to: .settingsEditExercise) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showSettingsEditCategory() {
        guard let viewController = makeViewController(to: .settingsEditCategory) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
    func showSettingsEditRoutine() {
        guard let viewController = makeViewController(to: .settingsEditRoutine) else { return }
        self.navigate(to: viewController, presentModally: false)
    }
}
