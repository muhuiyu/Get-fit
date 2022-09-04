//
//  WorkoutSessionViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/22/22.
//

import UIKit
import RxSwift

class WorkoutSessionViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    private let tableView = UITableView()
    private var cells = [[UITableViewCell]]()
    var viewModel = WorkoutSessionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - Handlers
extension WorkoutSessionViewController {
    private func didTapAddSet(for indexOfItemLog: Int) {
        viewModel.addSet(for: indexOfItemLog)
    }
    private func didTapAddExercise() {
        self.workoutCoordinator?.showExerciseList(sessionViewModel: viewModel)
    }
}

// MARK: - View Config
extension WorkoutSessionViewController {
    private func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
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
        viewModel.session
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
extension WorkoutSessionViewController {
    private func configureCells() {
        let headerSection = configureHeaderSection()
        let itemLogsSections = configureItemLogsSections()
        let addExerciseSection = configureAddExerciseSection()
        
        cells.removeAll()
        cells.append(headerSection)
        cells += itemLogsSections
        cells.append(addExerciseSection)
    }
    private func configureHeaderSection() -> [UITableViewCell] {
        guard let session = viewModel.session.value else { return [] }
        
        let titleCell = TextFieldCell()
        let startTimeCell = DateCell()
        let endTimeCell = DateCell()
        let noteCell = UITableViewCell()
        
        titleCell.textField.text = session.title
        titleCell.valueChangedHandler = { [weak self] in
            self?.viewModel.didChangeTitleValue(to: titleCell.value)
        }
        startTimeCell.title = AppText.Workout.startTime
        startTimeCell.date = session.startTime
        startTimeCell.endEditingHandler = { [weak self] in
            self?.viewModel.didChangeStartTime(to: startTimeCell.date)
        }
        endTimeCell.title = AppText.Workout.endTime
        endTimeCell.date = session.endTime
        endTimeCell.endEditingHandler = { [weak self] in
            self?.viewModel.didChangeEndTime(to: endTimeCell.date)
        }
        noteCell.textLabel?.textColor = .secondaryLabel
        noteCell.textLabel?.text = session.note.isEmpty ? AppText.Workout.note : session.note
        // TODO: - add note value change handler
        
        return [ titleCell, startTimeCell, endTimeCell, noteCell ]
    }
    private func configureItemLogsSections() -> [[UITableViewCell]] {
        guard let session = viewModel.session.value else { return [] }
        var sections = [[UITableViewCell]]()
        for (indexOfItemLog, itemLog) in session.itemLogs.enumerated() {
            var section = [UITableViewCell]()
            let headerCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            headerCell.textLabel?.text = WorkoutItem.getWorkoutItemName(of: itemLog.itemID)
            headerCell.detailTextLabel?.text = itemLog.note
            section.append(headerCell)
            for (indexOfSet, setLog) in itemLog.sets.enumerated() {
                let cell = WorkoutSetLogCell()
                cell.weightValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeWeightValue(itemLogAt: indexOfItemLog,
                                                         setLogAt: indexOfSet,
                                                         to: cell.weight)
                }
                cell.repsValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeRepsValue(itemLogAt: indexOfItemLog,
                                                       setLogAt: indexOfSet,
                                                       to: cell.reps)
                }
                cell.noteValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeNoteValue(itemLogAt: indexOfItemLog,
                                                       setLogAt: indexOfSet,
                                                       to: cell.note)
                }
                // TODO: - Add WarmUpSet check
                // cell.setIndex = setLog.isWarmUpSet ? 0 : index
                cell.setIndex = indexOfSet + 1
                cell.setLog = setLog
                section.append(cell)
            }
            let addSetCell = ButtonCell()
            addSetCell.title = AppText.Workout.addSet
            addSetCell.tapHandler = { [weak self] in
                self?.didTapAddSet(for: indexOfItemLog)
            }
            section.append(addSetCell)
            sections.append(section)
        }
        return sections
    }
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
extension WorkoutSessionViewController: UITableViewDataSource {
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
extension WorkoutSessionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        print(indexPath)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard viewModel.isSetLogCell(at: indexPath) else { return nil }
        
        let alertOption = BaseCoordinator.AlertControllerOption(title: "Delete set?",
                                                                message: "This action cannot be undone",
                                                                preferredStyle: .actionSheet)
        let deleteAction = BaseCoordinator.AlertActionOption(title: AppText.General.delete,
                                                             style: .destructive) { _ in
            self.viewModel.deleteSet(at: indexPath)
            self.tableView.isEditing = false
        }
        let cancelAction = BaseCoordinator.AlertActionOption(title: AppText.General.cancel,
                                                             style: .cancel) { _ in
            self.tableView.isEditing = false
        }
        let action = UIContextualAction(style: .destructive, title: AppText.General.delete) { _, _, _ in
            self.workoutCoordinator?.presentAlert(option: alertOption, actions: [cancelAction, deleteAction])
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

