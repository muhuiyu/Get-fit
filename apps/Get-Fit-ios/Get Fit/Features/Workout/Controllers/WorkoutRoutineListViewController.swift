//
//  WorkoutRoutineListViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxSwift

class WorkoutRoutineListViewController: BaseMVVMViewController<WorkoutRoutineListViewModel> {
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        
        viewModel.reloadData()
    }
}
// MARK: - Handlers
extension WorkoutRoutineListViewController {
    @objc
    private func didTapAdd(_ sender: UIBarButtonItem) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showCreateRoutine()
    }
    private func didSelectRoutine(at indexPath: IndexPath, _ item: WorkoutRoutine) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showWorkoutRoutine(for: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - View Config
extension WorkoutRoutineListViewController {
    private func configureViews() {
        configureNavigationBar()
        
        // table view
        tableView.delegate = self
        tableView.register(WorkoutRoutinePreviewCell.self, forCellReuseIdentifier: WorkoutRoutinePreviewCell.reuseID)
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
        viewModel.displayRoutines
            .asObservable()
            .bind(to: self.tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(WorkoutRoutine.self))
            .subscribe { indexPath, item in
                self.didSelectRoutine(at: indexPath, item)
            }
            .disposed(by: disposeBag)
    }
    private func configureNavigationBar() {
        title = viewModel.titleString
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: AppText.General.add,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapAdd(_:)))
    }
}
// MARK: - Delegate
extension WorkoutRoutineListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let coordinator = coordinator as? WorkoutCoordinator else { return nil }

        let alertOption = AlertControllerOption(title: "Delete routine?",
                                                message: "This action cannot be undone",
                                                preferredStyle: .actionSheet)
        let deleteAction = AlertActionOption(title: AppText.General.delete, style: .destructive) { _ in
            self.viewModel.deleteRoutine(at: indexPath)
            self.tableView.isEditing = false
        }
        let cancelAction = AlertActionOption(title: AppText.General.cancel, style: .cancel) { _ in
            self.tableView.isEditing = false
        }
        
        let action = UIContextualAction(style: .destructive, title: AppText.General.delete) { _, _, _ in
            coordinator.presentAlert(option: alertOption, actions: [cancelAction, deleteAction])
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

