//
//  WorkoutRoutineListViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxSwift

class WorkoutRoutineListViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    private let viewModel = WorkoutRoutineListViewModel()
    
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
}

// MARK: - View Config
extension WorkoutRoutineListViewController {
    private func configureViews() {
        title = viewModel.titleString
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: AppText.General.add,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapAdd(_:)))
        tableView.dataSource = self
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
        viewModel.routines
            .asObservable()
            .subscribe { _ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - Data Source
extension WorkoutRoutineListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.routines.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.getRoutineTitle(at: indexPath)
        cell.detailTextLabel?.text = viewModel.getRoutineSubtitle(at: indexPath)
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}
// MARK: - Delegate
extension WorkoutRoutineListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        if let item = viewModel.getRoutine(at: indexPath) {
            coordinator.showWorkoutRoutine(for: item)
        }
    }
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

