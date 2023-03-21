//
//  WorkoutSessionReorderExercisesViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/20/23.
//

import UIKit

class WorkoutSessionReorderExercisesViewController: ViewController {
    
    private let tableView = UITableView()
    private var itemLogs: [WorkoutItemLog]
    
    init(_ itemLogs: [WorkoutItemLog]) {
        self.itemLogs = itemLogs
        super.init()
    }
    
    var completion: (([WorkoutItemLog]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - Handlers
extension WorkoutSessionReorderExercisesViewController {
    @objc
    private func didTapCancel() {
        navigationController?.popViewController(animated: true)
    }
    @objc
    private func didTapDone() {
        completion?(itemLogs)
    }
}

// MARK: - View Config
extension WorkoutSessionReorderExercisesViewController {
    private func configureViews() {
        title = AppText.Workout.reorderExercises
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        tableView.dataSource = self
        tableView.isEditing = true
        tableView.delegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
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
        
    }
}
// MARK: - Delegate
extension WorkoutSessionReorderExercisesViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemLogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let name = WorkoutItem.getWorkoutItemName(of: itemLogs[indexPath.row].itemID) else { return UITableViewCell() }
        var content = cell.defaultContentConfiguration()
        content.text = name
        cell.contentConfiguration = content
        cell.showsReorderControl = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
            dragItem.localObject = itemLogs[indexPath.row]
            return [ dragItem ]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = itemLogs.remove(at: sourceIndexPath.row)
        itemLogs.insert(mover, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemLogs.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
