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
    private let tableView = UITableView()
    
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
//        self.hidesBottomBarWhenPushed = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
}
// MARK: - Handlers
extension WorkoutViewController {
    @objc
    private func didTapAdd() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        // TODO: - Add settings page
        let alertControllerOption = AlertControllerOption(title: AppText.Workout.addExercise,
                                                          message: nil,
                                                          preferredStyle: .actionSheet)
        let alertActions = [
            AlertActionOption(title: AppText.Workout.newSession, style: .default) { _ in
                guard
                    let userID = self.appCoordinator?.userManager.id,
                    let preferredWorkoutLength = self.appCoordinator?.userManager.preferredWorkoutLength else {
                    return
                }
                let session = WorkoutSession(userID: userID,
                                             preferredWorkoutLength: preferredWorkoutLength)
                coordinator.showSessionLog(for: session)
            },
            AlertActionOption(title: AppText.Workout.workoutRoutine, style: .default) { _ in
                coordinator.showWorkoutRoutineList()
            },
            AlertActionOption.cancel
        ]

        coordinator.presentAlert(option: alertControllerOption, actions: alertActions)
    }
    private func didSelectSession(at indexPath: IndexPath, _ item: WorkoutSession) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showSessionLog(for: item)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}
// MARK: - View Config
extension WorkoutViewController {
    private func configureViews() {
        title = viewModel.displayTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icons.plus),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapAdd))
        
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

