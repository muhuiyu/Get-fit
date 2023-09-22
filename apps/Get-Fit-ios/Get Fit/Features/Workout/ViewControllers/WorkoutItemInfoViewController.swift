//
//  WorkoutItemInfoViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 3/23/23.
//

import UIKit
import WebKit

class WorkoutItemInfoViewController: BaseViewController {

    private var cells: [[UITableViewCell]] = []
    private let tableView = UITableView()
    private let workoutItem: WorkoutItem
    
    init(appCoordinator: AppCoordinator? = nil,
         coordinator: BaseCoordinator? = nil,
         workoutItem: WorkoutItem) {
        self.workoutItem = workoutItem
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
// MARK: - Handlers
extension WorkoutItemInfoViewController {
    @objc
    private func didTapCancel() {
        guard let coordinator = coordinator else { return }
        coordinator.dismissCurrentModal()
    }
}

// MARK: - View Config
extension WorkoutItemInfoViewController {
    private func configureViews() {
        title = workoutItem.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
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
        if let urlString = workoutItem.videoURLString {
            let previewCell = WorkoutItemInfoPreviewCell(videoURLString: urlString)
            cells.append([ previewCell ])
        }
        
        let muscleCell = UITableViewCell()
        let instructionSection = [ UITableViewCell() ]
        let similarExercisesSection = [ UITableViewCell() ]
        
        cells.append([ muscleCell ])
        cells.append(instructionSection)
        cells.append(similarExercisesSection)
    }
}

// MARK: - Data Source
extension WorkoutItemInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
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


// MARK: - WorkoutItemInfoPreviewCell
import UIKit

class WorkoutItemInfoPreviewCell: UITableViewCell {
    static let reuseID = NSStringFromClass(WorkoutItemInfoPreviewCell.self)
    
    private let view = UIView()
    private var webPlayer = WKWebView()
    private let videoURLString: String
    private var allowsInlineMediaPlayback = true
    
    init(videoURLString: String, allowsInlineMediaPlayback: Bool = true) {
        
        self.allowsInlineMediaPlayback = allowsInlineMediaPlayback
        self.videoURLString = allowsInlineMediaPlayback ? videoURLString : (videoURLString + "?playsinline=1")
        super.init(style: .default, reuseIdentifier: nil)
        
        contentView.addSubview(view)
        view.snp.remakeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(snp.width).multipliedBy(0.5625)
        }
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let videoURL = URL(string: videoURLString) else { return }
            self.webPlayer = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
            self.view.addSubview(self.webPlayer)
            let request = URLRequest(url: videoURL)
            self.webPlayer.load(request)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
