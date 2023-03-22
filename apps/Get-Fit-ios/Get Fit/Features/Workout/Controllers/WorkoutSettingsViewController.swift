//
//  WorkoutSettingsViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/22/23.
//

import UIKit

class WorkoutSettingsViewController: BaseMVVMViewController<WorkoutSettingsViewModel> {
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        configureViews()
        configureConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viewModel.reloadSessions()
//        self.hidesBottomBarWhenPushed = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
}
// MARK: - View Config
extension WorkoutSettingsViewController {
    private func configureViews() {
        title = AppText.Workout.settings
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Delegate and DataSource
extension WorkoutSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.cells.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cells[indexPath.section][indexPath.row]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        switch indexPath.section {
        case WorkoutSettingsViewModel.Cell.editExercise.sectionIndex:
            coordinator.showSettingsEditExercise()
        case WorkoutSettingsViewModel.Cell.editCategory.sectionIndex:
            coordinator.showSettingsEditCategory()
        case WorkoutSettingsViewModel.Cell.editRoutine.sectionIndex:
            coordinator.showSettingsEditRoutine()
        default: return
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.snp.remakeConstraints { make in
            make.height.equalTo(Constants.Spacing.small)
        }
        return view
    }
}


