//
//  WorkoutViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import UIKit
import RxSwift
import RxDataSources

class WorkoutViewController: BaseMVVMViewController<WorkoutViewModel> {
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        
        viewModel.reloadSessions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadSessions()
    }
}
// MARK: - Handlers
extension WorkoutViewController {
    @objc
    private func didTapAdd() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        let alertControllerOption = AlertControllerOption(title: AppText.Workout.addExercise,
                                                          message: nil,
                                                          preferredStyle: .actionSheet)
        let alertActions = [
            AlertActionOption(title: AppText.Workout.startAnEmptyWorkout, style: .default) { _ in
                guard
                    let userID = self.appCoordinator?.userManager.id,
                    let preferredWorkoutLength = self.appCoordinator?.userManager.preferredWorkoutLength else {
                    return
                }
                coordinator.showNewSession(for: userID, preferredWorkoutLength: preferredWorkoutLength)
            },
            AlertActionOption(title: AppText.Workout.workoutRoutine, style: .default) { _ in
                coordinator.showWorkoutRoutineList()
            },
            AlertActionOption.cancel
        ]

        coordinator.presentAlert(option: alertControllerOption, actions: alertActions)
    }
    @objc
    private func didTapSettings() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showSettings()
    }
    @objc
    private func didTapRoutines() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showWorkoutRoutineList()
    }
    private func didSelectSession(at indexPath: IndexPath, _ item: WorkoutSession) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showSessionLog(for: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - View Config
extension WorkoutViewController {
    private func configureViews() {
        configureNavigationBar()
        
        // table view
        tableView.register(WorkoutSessionPreviewCell.self, forCellReuseIdentifier: WorkoutSessionPreviewCell.reuseID)
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        viewModel.displaySessions
            .asObservable()
            .bind(to: self.tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(WorkoutSession.self))
            .subscribe { indexPath, item in
                self.didSelectSession(at: indexPath, item)
            }
            .disposed(by: disposeBag)
    }
    private func configureNavigationBar() {
        title = viewModel.displayTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Routines",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapRoutines))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: Icons.plus),
                            style: .plain,
                            target: self,
                            action: #selector(didTapAdd)),
            UIBarButtonItem(image: UIImage(systemName: Icons.gearshape),
                            style: .plain,
                            target: self,
                            action: #selector(didTapSettings)),
        ]
    }
}

// MARK: - Delegate
extension WorkoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return nil }
        
        let alertOption = AlertControllerOption(title: "Delete workout?",
                                                message: "The record will be permanently deleted from the database.",
                                                preferredStyle: .alert)
        let deleteAction = AlertActionOption(title: "Delete", style: .destructive) { _ in
            self.viewModel.deleteWorkoutSession(at: indexPath)
            self.tableView.isEditing = false
        }
        let cancelAction = AlertActionOption(title: "Cancel", style: .cancel) { _ in
            self.tableView.isEditing = false
        }
        let action = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            coordinator.presentAlert(option: alertOption, actions: [cancelAction, deleteAction])
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .normal, title: "Duplicate") { _, _, _ in
//            let transaction = self.transactionListViewModel.getTransaction(at: indexPath)
//            self.homeCoordinator?.showAddTransaction(copyFrom: transaction)
//            self.tableView.isEditing = false
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
}

