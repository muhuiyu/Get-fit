//
//  WorkoutItemInfoViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/23/23.
//

import UIKit

class WorkoutItemInfoViewController: BaseViewController {

    private var cells: [[UITableViewCell]] = []
    
    private let tableView = UITableView()
    private let workoutItem: WorkoutItem
    
    init(appCoordinator: AppCoordinator? = nil,
         coordinator: BaseCoordinator? = nil,
         workoutItem: WorkoutItem) {
        super.init()
        self.appCoordinator = appCoordinator
        self.coordinator = coordinator
        self.workoutItem = workoutItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }
}
// MARK: - View Config
extension WorkoutItemInfoViewController {
    private func configureViews() {
        title = workoutItem.name
        configureCells()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureCells() {
        // TODO: -
        let previewCell = UITableViewCell()
        let muscleCell = UITableViewCell()
        let instructionSection = [ UITableViewCell() ]
        let similarExercisesSection = [ UITableViewCell() ]
        
        cells.append([ previewCell ])
        cells.append([ muscleCell ])
        cells.append(instructionSection)
        cells.append(similarExercisesSection)
    }
}

// MARK: - Data Source
extension WorkoutItemInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

// MARK: - Delegate
extension WorkoutItemInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        print(indexPath)
    }
}

