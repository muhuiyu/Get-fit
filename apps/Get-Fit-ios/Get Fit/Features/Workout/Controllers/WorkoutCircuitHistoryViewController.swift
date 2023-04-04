//
//  WorkoutCircuitHistoryViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 4/3/23.
//

import UIKit

class WorkoutCircuitHistoryViewController: BaseViewController {
    private let tableView = UITableView()
    private var items: [WorkoutCircuitWithDate]
    private var cells = [[UITableViewCell]] ()
    
    init(title: String, _ items: [WorkoutCircuitWithDate]) {
        self.items = items
        super.init()
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icons.questionmarkCircle), style: .plain, target: self, action: #selector(didTapInfo))
        
        cells = configureCircuitSections()
        tableView.dataSource = self
        tableView.delegate = self
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
            for (setIndex, set) in item.circuit.sets.enumerated() {
                let cell = WorkoutSetCell()
                cell.setIndexString = item.circuit.setIndexString(forSetAt: setIndex)
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
extension WorkoutCircuitHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row].title
        cell.contentConfiguration = content
        cell.showsReorderControl = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
            dragItem.localObject = items[indexPath.row]
            return [ dragItem ]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = items.remove(at: sourceIndexPath.row)
        items.insert(mover, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

