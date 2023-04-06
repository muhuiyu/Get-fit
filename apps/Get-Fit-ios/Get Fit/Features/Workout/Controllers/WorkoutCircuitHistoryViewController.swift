//
//  WorkoutCircuitHistoryViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 4/3/23.
//

import UIKit

class WorkoutCircuitHistoryViewController: BaseViewController {
    private let tableView = UITableView()
    private var items: [WorkoutCircuit]
    private var cells = [[UITableViewCell]] ()
    
    init(appCoordinator: AppCoordinator?,
         coordinator: BaseCoordinator?,
         title: String,
         _ items: [WorkoutCircuit]) {
        self.items = items
        super.init(appCoordinator: appCoordinator, coordinator: coordinator)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - Handlers
extension WorkoutCircuitHistoryViewController {
    @objc
    private func didTapClose() {
        guard let coordinator = coordinator else { return }
        coordinator.dismissCurrentModal()
    }
    @objc
    private func didTapInfo() {
        
    }
}

// MARK: - View Config
extension WorkoutCircuitHistoryViewController {
    private func configureViews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icons.questionmarkCircle), style: .plain, target: self, action: #selector(didTapInfo))
        
        cells = configureCircuitSections()
        tableView.dataSource = self
        tableView.allowsSelection = false
        view.addSubview(tableView)
    }
    private func configureCircuitSections() -> [[UITableViewCell]] {
        var sections = [[UITableViewCell]]()
        
        for item in items {
            var section = [UITableViewCell]()
            
            // Header cell
            let headerCell = TitleSubtitleButtonCell()
            headerCell.title = item.date.toString(in: "MMM dd, yyyy")
            headerCell.subtitle = ""
            headerCell.titleFont = UIFont.bodyMedium
            section.append(headerCell)
            
            // Set cells
            for (setIndex, set) in item.sets.enumerated() {
                let cell = WorkoutSetCell(isEditable: false)
                cell.setIndexString = item.setIndexString(forSetAt: setIndex)
                cell.set = set
                section.append(cell)
            }
            sections.append(section)
        }
        return sections
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

// MARK: - Delegate
extension WorkoutCircuitHistoryViewController: UITableViewDataSource {
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

