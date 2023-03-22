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
    private func didTapAddSet(for circuitIndex: Int) {
        viewModel.addSet(for: circuitIndex)
    }
    private func didTapAddExercise() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.showExerciseList(sessionViewModel: viewModel)
    }
    private func didTapAddSpecialSet() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.presentAlert(option: AlertControllerOption(title: AppText.Workout.addSpecialSet,
                                                               message: "Choose type", preferredStyle: .actionSheet),
                                 actions: [
                                    AlertActionOption(title: AppText.Workout.addSuperSet, style: .default, handler: { _ in
                                        coordinator.showExerciseList(sessionViewModel: self.viewModel,
                                                                     circuitType: .superSet)
                                    }),
                                    AlertActionOption(title: AppText.Workout.addCircuit, style: .default, handler: { _ in
                                        coordinator.showExerciseList(sessionViewModel: self.viewModel,
                                                                     circuitType: .circuit)
                                    }),
                                    AlertActionOption.cancel,
                                 ])
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
    
    private func didTapReorderCircuits() {
        // TODO: -
        guard
            let coordinator = coordinator as? WorkoutCoordinator,
            let session = viewModel.session.value
        else { return }
        let viewController = WorkoutSessionReorderExercisesViewController(session.circuits)
        viewController.completion = { [weak self] value in
            self?.viewModel.didChangeCircuitsOrder(to: value)
        }
        coordinator.navigate(to: viewController.embedInNavgationController(), presentModally: true)
    }

    private func didTapSaveAsRoutine() {
        // TODO: -
    }

    private func presentSetDetailsActionSheet(circuitAt circuitIndex: Int,
                                              setAt setIndex: Int) {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        
        let handler: ((UIAlertAction) -> Void) = { action in
            let type: WorkoutSetType
            switch action.title {
            case AppText.Workout.normal: type = .normal
            case AppText.Workout.warmUp: type = .warmUp
            case AppText.Workout.dropSet: type = .dropSet
            default: type = .normal
            }
            self.viewModel.didChangeSetType(circuitAt: circuitIndex, setAt: setIndex, to: type)
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
            UIAction(title: AppText.Workout.reorderCircuits, image: nil, handler: { _ in
                self.didTapReorderCircuits()
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
        let circuitSections = configureCircuitSections()
        let addExerciseSection = configureAddExerciseSection()
        let addSpeicalSection = configureAddSpecialSetSection()
        
        cells.removeAll()
        cells.append(headerSection)
        cells += circuitSections
        cells.append(addExerciseSection)
        cells.append(addSpeicalSection)
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
    private func configureCircuitSections() -> [[UITableViewCell]] {
        guard let session = viewModel.session.value else { return [] }
        var sections = [[UITableViewCell]]()
        
        for (circuitIndex, circuit) in session.circuits.enumerated() {
            var section = [UITableViewCell]()
            
            // Header cell
            let headerCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            var content = headerCell.defaultContentConfiguration()
            content.text = circuit.title
            headerCell.contentConfiguration = content
            section.append(headerCell)
            
            // Set cells
            for (setIndex, set) in circuit.sets.enumerated() {
                let cell = WorkoutSetCell()
                cell.weightValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeWeightValue(circuitAt: circuitIndex, setAt: setIndex, to: cell.weight)
                }
                cell.repsValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeRepsValue(circuitAt: circuitIndex, setAt: setIndex, to: cell.reps)
                }
                cell.noteValueChangedHandler = { [weak self] in
                    self?.viewModel.didChangeNoteValue(circuitAt: circuitIndex, setAt: setIndex, to: cell.note)
                }
                cell.moreButtonTapHandler = { [weak self] in
                    self?.presentSetDetailsActionSheet(circuitAt: circuitIndex, setAt: setIndex)
                }
                cell.setIndexString = circuit.setIndexString(forSetAt: setIndex)
                cell.set = set
                section.append(cell)
            }
            
            // Add set cell
            let addSetCell = ButtonCell()
            addSetCell.title = AppText.Workout.addSet
            addSetCell.tapHandler = { [weak self] in
                self?.didTapAddSet(for: circuitIndex)
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
    private func configureAddSpecialSetSection() -> [UITableViewCell] {
        let cell = ButtonCell()
        cell.title = AppText.Workout.addSpecialSet
        cell.tapHandler = { [weak self] in
            self?.didTapAddSpecialSet()
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
            viewModel.isSetCell(at: indexPath),
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

