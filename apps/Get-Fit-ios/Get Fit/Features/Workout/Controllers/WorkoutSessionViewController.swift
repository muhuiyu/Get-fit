//
//  WorkoutSessionViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/22/22.
//

import UIKit
import RxSwift

class WorkoutSessionViewController: BaseMVVMViewController<WorkoutSessionViewModel> {
    
    private let tableView = UITableView()
    private var cells = [[UITableViewCell]]()
    
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
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showExerciseList(sessionViewModel: viewModel)
    }
    private func didTapAddSuperSet() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showExerciseList(sessionViewModel: viewModel, allowsMultipleSelection: true)
    }
    @objc
    private func didTapTimer() {
        
    }
    
    private func didTapDeleteSession() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.presentAlert(option: AlertControllerOption(title: "Are you sure you want to delete this workout?",
                                                               message: "This action cannot be undone",
                                                               preferredStyle: .actionSheet),
                                 actions: [
                                    AlertActionOption(title: AppText.General.delete, style: .destructive, handler: { _ in
                                        self.viewModel.deleteSession()
                                        self.navigationController?.popViewController(animated: true)
                                    }),
                                    AlertActionOption.cancel
                                 ])
    }
    
    private func didTapReorderExercises() {
        guard
            let coordinator = coordinator as? WorkoutCoordinator,
            let session = viewModel.session.value
        else { return }
        let viewController = WorkoutSessionReorderExercisesViewController(session.itemLogs)
        viewController.completion = { [weak self] itemLogs in
            self?.viewModel.didChangeItemLogsOrder(to: itemLogs)
        }
        coordinator.navigate(to: viewController.embedInNavgationController(), presentModally: true)
    }

    private func didTapSaveAsRoutine() {
        // TODO: -
    }

    private func presentSetDetailsActionSheet(itemLogAt indexOfItemLog: Int,
                                              setLogAt indexOfSetLog: Int) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        
        let handler: ((UIAlertAction) -> Void) = { action in
            switch action.title {
            case AppText.Workout.normal:
                self.viewModel.didChangeSetType(itemLogAt: indexOfItemLog, setLogAt: indexOfSetLog, to: .normal)
            case AppText.Workout.warmUp:
                self.viewModel.didChangeSetType(itemLogAt: indexOfItemLog, setLogAt: indexOfSetLog, to: .warmUp)
            case AppText.Workout.dropSet:
                self.viewModel.didChangeSetType(itemLogAt: indexOfItemLog, setLogAt: indexOfSetLog, to: .dropSet)
            default: return
            }
        }
        
        coordinator.presentAlert(option: AlertControllerOption(title: "Choose set type", message: nil, preferredStyle: .actionSheet),
                                 actions: [
                                    AlertActionOption(title: AppText.Workout.normal, style: .default, handler: handler),
                                    AlertActionOption(title: AppText.Workout.warmUp, style: .default, handler: handler),
                                    AlertActionOption(title: AppText.Workout.dropSet, style: .default, handler: handler),
                                    AlertActionOption.cancel
                                 ])
    }

}

// MARK: - View Config
extension WorkoutSessionViewController {
    private func configureViews() {
        configureNavigationItems()
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
            .subscribe { value in
                guard let value = value else { return }
                self.title = value.dateString
                self.configureCells()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
    }
    private func configureNavigationItems() {
        // View more
        let items = UIMenu(options: .displayInline, children: [
            UIAction(title: AppText.Workout.reorderExercises, image: nil, handler: { _ in
                self.didTapReorderExercises()
            }),
            UIAction(title: AppText.Workout.SaveAsRoutine, image: nil, handler: { _ in
                self.didTapSaveAsRoutine()
            }),
        ])
        let destruct = UIAction(title: AppText.General.delete, image: nil, attributes: .destructive) { _ in
            self.didTapDeleteSession()
        }
        
        let viewMoreButton = UIBarButtonItem(image: UIImage(systemName: Icons.ellipsis), style: .plain, target: self, action: nil)
        viewMoreButton.menu = UIMenu(title: "", children: [items, destruct])
        
        // Timer
        let timerButton = UIBarButtonItem(image: UIImage(systemName: Icons.timer),
                                          style: .plain,
                                          target: self,
                                          action: #selector(didTapTimer))
        
        navigationItem.rightBarButtonItems = [ viewMoreButton, timerButton ]
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
                    self?.viewModel.didChangeWeightValue(itemLogAt: indexOfItemLog, setLogAt: indexOfSet, to: cell.weight)
                }
                cell.repsValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeRepsValue(itemLogAt: indexOfItemLog, setLogAt: indexOfSet, to: cell.reps)
                }
                cell.noteValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeNoteValue(itemLogAt: indexOfItemLog, setLogAt: indexOfSet, to: cell.note)
                }
                cell.moreButtonTapHandler = { [weak self] in
                    self?.presentSetDetailsActionSheet(itemLogAt: indexOfItemLog, setLogAt: indexOfSet)
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
        let cell = ButtonCell()
        cell.title = AppText.Workout.addExercise
        cell.tapHandler = { [weak self] in
            self?.didTapAddExercise()
        }
        return [ cell ]
    }
    private func configureAddSuperSetSection() -> [UITableViewCell] {
        let cell = ButtonCell()
        cell.title = AppText.Workout.addSuperSet
        cell.tapHandler = { [weak self] in
            self?.didTapAddSuperSet()
        }
        return [ cell ]
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
        guard
            viewModel.isSetLogCell(at: indexPath),
            let coordinator = coordinator as? WorkoutCoordinator
        else { return nil }
        
        let alertOption = AlertControllerOption(title: "Delete set?",
                                                message: "This action cannot be undone",
                                                preferredStyle: .actionSheet)
        let deleteAction = AlertActionOption(title: AppText.General.delete,
                                             style: .destructive) { _ in
            self.viewModel.deleteSet(at: indexPath)
            self.tableView.isEditing = false
        }
        let cancelAction = AlertActionOption(title: AppText.General.cancel,
                                             style: .cancel) { _ in
            self.tableView.isEditing = false
        }
        let action = UIContextualAction(style: .destructive, title: AppText.General.delete) { _, _, _ in
            coordinator.presentAlert(option: alertOption, actions: [cancelAction, deleteAction])
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

