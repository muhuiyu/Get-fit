//
//  WorkoutSessionReorderExercisesViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/20/23.
//

import UIKit

class WorkoutSessionReorderExercisesViewController: ViewController {
    
    private let tableView = UITableView()
    private var items: [WorkoutCircuit]
    
    init(_ items: [WorkoutCircuit]) {
        self.items = items
        super.init()
    }
    
    var completion: ((Bool, [WorkoutCircuit]) -> Void)?
    
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
        completion?(false, items)
    }
    @objc
    private func didTapDone() {
        completion?(true, items)
    }
}

// MARK: - View Config
extension WorkoutSessionReorderExercisesViewController {
    private func configureViews() {
        title = AppText.Workout.reorderCircuits
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
