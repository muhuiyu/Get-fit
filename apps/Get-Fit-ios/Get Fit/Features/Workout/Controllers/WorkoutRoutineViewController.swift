//
//  WorkoutRoutineViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxSwift

class WorkoutRoutineViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    private var cells = [[UITableViewCell]]()
    var viewModel = WorkoutRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureSignals()
    }
}
// MARK: - Handlers
extension WorkoutRoutineViewController {
    private func didTapAddExercise() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showExerciseList(routineViewModel: viewModel, sessionViewModel: nil)
    }
    private func didStartRoutine() {
        guard
            let coordinator = coordinator as? WorkoutCoordinator,
            let routine = viewModel.routine.value,
            let userID = appCoordinator?.userManager.id,
            let preferredWorkoutLength = appCoordinator?.userManager.preferredWorkoutLength else {
            return
        }
        let session = WorkoutSession(createdFrom: routine,
                                     userID: userID,
                                     preferredWorkoutLength: preferredWorkoutLength)
        coordinator.showSessionLog(for: session)
    }
}
// MARK: - View Config
extension WorkoutRoutineViewController {
    private func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureSignals() {
        viewModel.routine
            .asObservable()
            .subscribe { _ in
                self.configureCells()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.displayTitleString
            .asObservable()
            .subscribe { value in
                self.title = value
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - Configure Cells
extension WorkoutRoutineViewController {
    private func configureCells() {
        let headerSection = configureHeaderSection()
//        let itemLogsSection = configureItemLogsSection()
        let addExerciseSection = configureAddExerciseSection()
        cells.removeAll()
        cells.append(headerSection)
//        if !itemLogsSection.isEmpty {
//            cells.append(itemLogsSection)
//        }
        cells.append(addExerciseSection)
    }
    private func configureHeaderSection() -> [UITableViewCell] {
        guard let routine = viewModel.routine.value else { return [] }
        
        let titleCell = TextFieldCell()
        let noteCell = UITableViewCell()
        let startButtonCell = ButtonCell()
        
        titleCell.textField.text = routine.title
        titleCell.valueChangedHandler = { [weak self] in
            self?.viewModel.didChangeTitleValue(to: titleCell.value)
        }
        noteCell.textLabel?.text = AppText.Workout.note
        noteCell.textLabel?.textColor = .secondaryLabel
        if !routine.note.isEmpty {
            noteCell.textLabel?.text = routine.note
        }
        // TODO: - Add note value Changed Handler?
        startButtonCell.title = AppText.Workout.startThisRoutine
        startButtonCell.tapHandler = { [weak self] in
            self?.didStartRoutine()
        }
        return [ titleCell, noteCell, startButtonCell ]
    }
//    private func configureItemLogsSection() -> [UITableViewCell] {
//        guard let routine = viewModel.routine.value else { return [] }
//        var section = [UITableViewCell]()
//        if !routine.itemLogs.isEmpty {
//            routine.itemLogs.forEach { item in
//                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//                let numberOfSets = item.sets.count
//                cell.textLabel?.text = WorkoutItem.getWorkoutItemName(of: item.itemID)
//                cell.detailTextLabel?.text = numberOfSets > 1 ? "\(String(numberOfSets)) sets" : "1 set"
//                section.append(cell)
//            }
//        }
//        return section
//    }
    private func configureAddExerciseSection() -> [UITableViewCell] {
        let addExerciseCell = ButtonCell()
        addExerciseCell.title = AppText.Workout.addExercise
        addExerciseCell.tapHandler = { [weak self] in
            self?.didTapAddExercise()
        }
        return [ addExerciseCell ]
    }

}
// MARK: - Data Source
extension WorkoutRoutineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.snp.remakeConstraints { make in
            make.height.equalTo(Constants.Spacing.small)
        }
        return view
    }
}
// MARK: - Delegate
extension WorkoutRoutineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        defer {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
//
//        // if user clicks on valid itemLog
//        if let itemLog = viewModel.getItemLog(at: indexPath) {
//            coordinator.showCircuitDetails(for: itemLog)
//        }
    }
}

