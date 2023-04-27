//
//  WorkoutExerciseListViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import Foundation
import UIKit
import RxSwift

class WorkoutExerciseListViewController: BaseViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    private var selectedItemsView = UIView()
    
    private let routineViewModel: WorkoutRoutineViewModel?
    private let sessionViewModel: WorkoutSessionViewModel?
    private let options: [WorkoutItemID] = WorkoutItem.getAllWorkoutItemIDs()
    private var selectedIndex: Int?
    private let circuitType: WorkoutCircuitType
    
    private var selectedItemIDs = Set<String>()
    
    private var allowsMultipleSelection: Bool {
        circuitType != .singleExercise
    }
    
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    private var filteredOptions = [String]()
    
    init(appCoordinator: AppCoordinator? = nil,
         coordinator: BaseCoordinator? = nil,
         routineViewModel: WorkoutRoutineViewModel? = nil,
         sessionViewModel: WorkoutSessionViewModel? = nil,
         circuitType: WorkoutCircuitType) {
        self.routineViewModel = routineViewModel
        self.sessionViewModel = sessionViewModel
        self.circuitType = circuitType
        super.init()
        self.appCoordinator = appCoordinator
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }
}
// MARK: - Navigation
extension WorkoutExerciseListViewController {
    @objc
    private func didTapCancel() {
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        coordinator.dismissCurrentModal()
    }
    @objc
    private func didTapSave() {
        // Only available for multiple selection
        guard let coordinator = coordinator as? WorkoutCoordinator else { return }
        if let routineViewModel = routineViewModel {
            // TODO: -
//            routineViewModel.addExercise(for: itemID)
        } else if let sessionViewModel = sessionViewModel {
            sessionViewModel.addCircuit(for: Array(selectedItemIDs), as: circuitType)
        }
        coordinator.dismissCurrentModal()
    }
}
// MARK: - View Config
extension WorkoutExerciseListViewController {
    private func configureViews() {
        configureNavigationBar()
        view.addSubview(selectedItemsView)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        selectedItemsView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(selectedItemsView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureNavigationBar() {
        title = AppText.Workout.selectExercise
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppText.General.search
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.setBarButtonItem(at: .left,
                                        with: AppText.General.cancel,
                                        isBold: false,
                                        target: self,
                                        action: #selector(didTapCancel))
        
        if allowsMultipleSelection {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        }
    }
    private func reconfigureSelectedItemsView() -> UIView {
        if selectedItemIDs.count == 0 {
            return UIView()
        }
        
        let stackView = UIStackView()
        for id in selectedItemIDs {
            if let item = WorkoutItem.getWorkoutItem(of: id) {
                stackView.addArrangedSubview(ChipView(text: item.name))
            }
        }
        stackView.axis = .horizontal
        stackView.spacing = Constants.Spacing.trivial
        return stackView
    }
}
// MARK: - Data Source
extension WorkoutExerciseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredOptions.count : options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let workoutItemID = isFiltering ? filteredOptions[indexPath.row] : options[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = WorkoutItem.getWorkoutItemName(of: workoutItemID)
        cell.selectionStyle = .none
        cell.accessoryType = selectedItemIDs.contains(workoutItemID) ? .checkmark : .none
        
        if let item = WorkoutItem.getWorkoutItem(of: workoutItemID) {
            cell.detailTextLabel?.text = item.getBodyPartString
            cell.detailTextLabel?.textColor = .secondaryLabel
        }
        return cell
    }
}
// MARK: - Delegate
extension WorkoutExerciseListViewController: UITableViewDelegate {
    private func didSelectSingleWorkoutItem() {
        guard let coordinator = coordinator as? WorkoutCoordinator, selectedItemIDs.count == 1 else { return }
        if let routineViewModel = routineViewModel {
            // TODO: -
//            routineViewModel.addExercise(for: itemID)
        } else if let sessionViewModel = sessionViewModel {
            sessionViewModel.addCircuit(for: Array(selectedItemIDs), as: .singleExercise)
        }
        coordinator.dismissCurrentModal()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkoutItemID = isFiltering ? filteredOptions[indexPath.row] : options[indexPath.row]
        if selectedItemIDs.contains(selectedWorkoutItemID) {
            selectedItemIDs.remove(selectedWorkoutItemID)
        } else {
            selectedItemIDs.insert(selectedWorkoutItemID)
        }
        
        if allowsMultipleSelection {
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            cell.setSelected(!cell.isSelected, animated: true)
            tableView.reloadData()
            selectedItemsView = reconfigureSelectedItemsView()
        } else {
            didSelectSingleWorkoutItem()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
// MARK: - SearchController
extension WorkoutExerciseListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filterOptionForSearchText(searchText)
    }
    func filterOptionForSearchText(_ searchText: String) {
        filteredOptions = options.filter({ id in
            guard let item = WorkoutItem.getWorkoutItem(of: id) else { return false }
            return item.shouldReturnAsSearchResult(for: searchText)
        })
        tableView.reloadData()
    }
}
