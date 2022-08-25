//
//  WorkoutViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import UIKit
import RxSwift
import RxDataSources

class WorkoutViewController: BaseViewController {
    private let disposeBag = DisposeBag()

    private let tableView = UITableView()
    var viewModel = WorkoutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        
        viewModel.reloadSessions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        // TODO: - Add settings page
        let alertControllerOption = BaseCoordinator.AlertControllerOption(title: AppText.Workout.addExercise,
                                                                          message: nil,
                                                                          preferredStyle: .actionSheet)
        let alertActions = [
            BaseCoordinator.AlertActionOption(title: AppText.Workout.newSession, style: .default) { _ in
                let session = WorkoutSession()
                self.workoutCoordinator?.showSessionLog(for: session)
            },
            BaseCoordinator.AlertActionOption(title: AppText.Workout.workoutRoutine, style: .default) { _ in
                self.workoutCoordinator?.showWorkoutRoutineList()
            },
            BaseCoordinator.AlertActionOption(title: AppText.General.cancel, style: .cancel, handler: nil)
        ]

        homeCoordinator?.presentAlert(option: alertControllerOption, actions: alertActions)
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
                self.workoutCoordinator?.showSessionLog(for: item)
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - Delegate
extension WorkoutViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let alertOption = BaseCoordinator.AlertControllerOption(title: "Delete transaction?",
//                                                                message: "The transaction will be permanently deleted from the database.",
//                                                                preferredStyle: .alert)
//        let deleteAction = BaseCoordinator.AlertActionOption(title: "Delete", style: .destructive) { _ in
//            self.transactionListViewModel.deleteTransaction(at: indexPath)
//            self.tableView.isEditing = false
//        }
//        let cancelAction = BaseCoordinator.AlertActionOption(title: "Cancel", style: .cancel) { _ in
//            self.tableView.isEditing = false
//        }
//        let action = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
//            self.homeCoordinator?.presentAlert(option: alertOption, actions: [cancelAction, deleteAction])
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .normal, title: "Duplicate") { _, _, _ in
//            let transaction = self.transactionListViewModel.getTransaction(at: indexPath)
//            self.homeCoordinator?.showAddTransaction(copyFrom: transaction)
//            self.tableView.isEditing = false
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
}

