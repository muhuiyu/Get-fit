//
//  WorkoutSessionViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/22/22.
//

import UIKit
import RxSwift

class WorkoutSessionViewController: BaseMVVMViewController<WorkoutSessionViewModel> {
    
    private let isNewSession: Bool
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var cells = [[UITableViewCell]]()
    private var footerBottomConstraint: NSLayoutConstraint?
    private var keyboardTrigger: IndexPath?
    
    init(appCoordinator: AppCoordinator? = nil,
         coordinator: BaseCoordinator? = nil,
         viewModel: WorkoutSessionViewModel,
         isNewSession: Bool = false) {
        self.isNewSession = isNewSession
        super.init(appCoordinator: appCoordinator, coordinator: coordinator, viewModel: viewModel)
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        configureKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.syncBackup()
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
        guard let coordinator = coordinator, let session = viewModel.session.value else { return }
        let viewController = WorkoutSessionReorderExercisesViewController(session.circuits)
        viewController.completion = { [weak self] (shouldUpdate, value) in
            coordinator.dismissCurrentModal()
            if shouldUpdate {
                self?.viewModel.didChangeCircuitsOrder(to: value)
            }
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

    private func didTapHistoryButton(_ circuit: WorkoutCircuit) {
        guard let coordinator = coordinator else { return }
        let items = viewModel.fetchHistory(for: circuit)
        let viewController = WorkoutCircuitHistoryViewController(appCoordinator: self.appCoordinator,
                                                                 coordinator: self.coordinator,
                                                                 title: circuit.singleLineTitle,
                                                                 items)
        coordinator.navigate(to: viewController.embedInNavgationController(), presentModally: true)
    }
    
    private func didTapInfo(_ circuit: WorkoutCircuit) {
        switch circuit.type {
        case .singleExercise:
            guard let workoutItem = WorkoutItem.getWorkoutItem(of: circuit.sets.first?.itemID ?? "") else { return }
            let viewController = WorkoutItemInfoViewController(appCoordinator: self.appCoordinator,
                                                               coordinator: self.coordinator,
                                                               workoutItem: workoutItem)
            coordinator?.navigate(to: viewController.embedInNavgationController(), presentModally: true)
        case .superSet, .circuit:
            var actions = circuit.workoutItems.map { item in
                return AlertActionOption(title: item.name, style: .default) { _ in
                    let viewController = WorkoutItemInfoViewController(appCoordinator: self.appCoordinator,
                                                                       coordinator: self.coordinator,
                                                                       workoutItem: item)
                    self.coordinator?.navigate(to: viewController.embedInNavgationController(), presentModally: true)
                }
            }
            actions.append(AlertActionOption.cancel)
            
            coordinator?.presentAlert(option: AlertControllerOption(title: "Choose exercise", message: nil, preferredStyle: .actionSheet), actions: actions)
        }
    }

    private func didTapMoreButton(at circuitIndex: Int, _ circuit: WorkoutCircuit) {
        // TODO: present alert
        // move, replace, delete
        // edit note
        // history, charts, personal records
        // settings (edit exercise)
        guard let coordinator = coordinator else { return }
        var actions = [
            AlertActionOption(title: AppText.Workout.info, style: .default) { _ in
                self.didTapInfo(circuit)
            },
            AlertActionOption(title: AppText.General.delete, style: .destructive) { _ in
                self.viewModel.deleteCircuit(at: circuitIndex)
            },
        ]
        actions.append(AlertActionOption.cancel)
        coordinator.presentAlert(option: AlertControllerOption(title: circuit.title, message: nil, preferredStyle: .actionSheet), actions: actions)
    }
    @objc
    private func didTapInView() {
        dismissKeyboard()
    }
}

// MARK: - View Config
extension WorkoutSessionViewController {
    private func configureViews() {
        configureNavigationItems()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            footerBottomConstraint = make.bottom
                .equalTo(view.safeAreaLayoutGuide)
                .inset(Constants.Spacing.medium)
                .constraint.layoutConstraints.first
        }
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView))
        view.addGestureRecognizer(tapRecognizer)
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
        
        let barItems: [UIBarButtonItem] =  [ viewMoreButton, timerButton ]
        navigationItem.rightBarButtonItems = barItems
    }
}
// MARK: - Keyboard
extension WorkoutSessionViewController {
    private func configureKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardHeightWillChange(note:)),
                                               name: UIView.keyboardWillChangeFrameNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(note:)),
                                               name: UIView.keyboardWillHideNotification,
                                               object: nil)
    }
    @objc
    private func keyboardHeightWillChange(note: Notification) {
        guard let keyboardFrame = note.userInfo?[UIView.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        animateKeyboard(to: keyboardFrame.height, userInfo: note.userInfo)
    }
    @objc
    private func keyboardWillHide(note: Notification) {
        animateKeyboard(to: 0, userInfo: note.userInfo)
        keyboardTrigger = nil
    }
    private func animateKeyboard(to height: CGFloat, userInfo: [AnyHashable : Any]?) {
        let duration = userInfo?[UIView.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.15
        let animationCurveRawValue = userInfo?[UIView.keyboardAnimationCurveUserInfoKey] as? UIView.AnimationCurve.RawValue
        let animationOptions: UIView.AnimationOptions
        switch animationCurveRawValue {
        case UIView.AnimationCurve.linear.rawValue:
            animationOptions = .curveLinear
        case UIView.AnimationCurve.easeIn.rawValue:
            animationOptions = .curveEaseIn
        case UIView.AnimationCurve.easeOut.rawValue:
            animationOptions = .curveEaseOut
        case UIView.AnimationCurve.easeInOut.rawValue:
            animationOptions = .curveEaseInOut
        default:
            animationOptions = .curveEaseInOut
        }
        footerBottomConstraint?.constant = -height
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [animationOptions, .beginFromCurrentState]) {
            self.view.layoutIfNeeded()
        } completion: { isSuccess in
            if isSuccess, let indexPath = self.keyboardTrigger {
                DispatchQueue.main.async {
                    print(indexPath)
                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
            }
        }
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
            let headerCell = TitleSubtitleButtonCell()
            
            let historyButton = IconButton(name: Icons.clockArrowCirclepath)
            historyButton.tapHandler = { [weak self] in
                self?.didTapHistoryButton(circuit)
            }
            historyButton.contentMode = .scaleAspectFit
            historyButton.iconColor = .Brand.primary
            
            let moreButton = IconButton(name: Icons.ellipsis)
            moreButton.tapHandler = { [weak self] in
                self?.didTapMoreButton(at: circuitIndex, circuit)
            }
            moreButton.contentMode = .scaleAspectFit
            moreButton.iconColor = .Brand.primary
            
            headerCell.icons = [historyButton, moreButton]
            
            switch circuit.type {
            case .singleExercise, .circuit:
                headerCell.title = circuit.title
                headerCell.subtitle = ""
                headerCell.titleFont = UIFont.bodyMedium
            case .superSet:
                headerCell.title = AppText.Workout.superSet
                headerCell.titleColor = UIColor.secondaryLabel
                headerCell.titleFont = UIFont.small
                headerCell.subtitle = circuit.title
                headerCell.subtitleColor = UIColor.label
                headerCell.subtitleFont = UIFont.body
                headerCell.numberOfLinesOfSubtitle = circuit.workoutItems.count
            }
            section.append(headerCell)
            
            // Set cells
            for (setIndex, set) in circuit.sets.enumerated() {
                let cell = WorkoutSetCell()
                cell.tapHandler = { [weak self] in
                    self?.keyboardTrigger = self?.viewModel.getIndexPath(atCircuit: circuitIndex, atSet: setIndex)
                }
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
            if circuit.type != .circuit {
                let addSetCell = ButtonCell()
                addSetCell.title = AppText.Workout.addSet
                addSetCell.tapHandler = { [weak self] in
                    self?.didTapAddSet(for: circuitIndex)
                }
                section.append(addSetCell)
            }
            
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
        // TODO: - 
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

