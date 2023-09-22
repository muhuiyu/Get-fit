//
//  WorkoutRoutinePreviewViewController.swift
//  Get Fit
//
//  Created by Grace, Mu-Hui Yu on 7/22/23.
//

import UIKit
import RxSwift

class WorkoutRoutinePreviewViewController: BaseMVVMViewController<WorkoutRoutineViewModel> {
    
    // MARK: - Views
    private let containerView = UIView()
    private let closeButton = IconButton(icon: UIImage(systemName: Icons.xmark))
    private let titleLabel = UILabel()
    private let lastPerformedLabel = UILabel()
    private let tableView = UITableView()
    private let startButton = TextButton(buttonType: .primary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureSignals()
    }
}

// MARK: - View Config
extension WorkoutRoutinePreviewViewController {
    private func configureViews() {
        containerView.backgroundColor = .white
        view.addSubview(containerView)
        // cell use default style
//        tableView.register(WorkoutItemCell.self, forCellReuseIdentifier: WorkoutItemCell.reuseID)
        tableView.register(TitleSubtitleButtonCell.self, forCellReuseIdentifier: TitleSubtitleButtonCell.reuseID)
        tableView.allowsSelection = false
        containerView.addSubview(tableView)
    }
    private func configureConstraints() {
        containerView.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func reconfigureData() {
        
        tableView.reloadData()
    }
    private func configureSignals() {
        viewModel.routine
            .asObservable()
            .subscribe { [weak self] _ in
                self?.reconfigureData()
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - TableView Delegate & DataSource
extension WorkoutRoutinePreviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let circuits = viewModel.routine.value?.circuits else { return 0 }
        return circuits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let circuits = viewModel.routine.value?.circuits else { return UITableViewCell() }
//        let cell = WorkoutCircuitHeaderCell(
//            circuit: circuits[indexPath.row],
//            historyButtonTapHandler: {
//
//        },
//            infoButtonTapHandler: {
//        })
//
//        return cell
        return UITableViewCell()
    }
}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let workoutItemID = isFiltering ? filteredOptions[indexPath.row] : options[indexPath.row]
//
//    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//    cell.textLabel?.text = WorkoutItem.getWorkoutItemName(of: workoutItemID)
//    cell.selectionStyle = .none
//    cell.accessoryType = selectedItemIDs.contains(workoutItemID) ? .checkmark : .none
//
//    if let item = WorkoutItem.getWorkoutItem(of: workoutItemID) {
//        cell.detailTextLabel?.text = item.getBodyPartString
//        cell.detailTextLabel?.textColor = .secondaryLabel
//    }
//    return cell
//}
