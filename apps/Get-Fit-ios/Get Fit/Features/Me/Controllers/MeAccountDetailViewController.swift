//
//  MeAccountDetailViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit
import RxSwift

class MeAccountDetailViewController: BaseMVVMViewController<MeAccountViewModel> {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private var cells: [[UITableViewCell]] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override init(appCoordinator: AppCoordinator? = nil, coordinator: BaseCoordinator? = nil, viewModel: MeAccountViewModel) {
        super.init(viewModel: viewModel)
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        configureViews()
        configureConstraints()
        configureGestures()
    }
}
// MARK: - View Config
extension MeAccountDetailViewController {
    struct Section {
        static let signedInAs = 0
        static let sync = 1
        static let signout = 2
    }
    
    private func configureCells() {
        cells.removeAll()
        let signInAsSection = configureSignInAsSection()
        cells.append(signInAsSection)
        let syncSection = configureSyncSection()
        cells.append(syncSection)
        let signoutSection = configureSignoutSection()
        cells.append(signoutSection)
    }
    
    private func configureSignInAsSection() -> [UITableViewCell] {
        let cell = UITableViewCell()   // indexPath (0, 0)
        var content = cell.defaultContentConfiguration()
        content.text = appCoordinator?.userManager.email
        cell.contentConfiguration = content
        return [cell]
    }
    
    private func configureSyncSection() -> [UITableViewCell] {
        let cell = UITableViewCell()   // indexPath (1, 0)
        var content = cell.defaultContentConfiguration()
        content.text = AppText.Me.sync
        cell.contentConfiguration = content
        return [cell]
    }

    private func configureSignoutSection() -> [UITableViewCell] {
        let cell = UITableViewCell()   // indexPath (2, 0)
        var content = cell.defaultContentConfiguration()
        content.text = AppText.Me.signOut
        cell.contentConfiguration = content
        return [cell]
    }

    private func configureViews() {
        title = AppText.Me.account
        tableView.delegate = self
        tableView.dataSource = self
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


// MARK: - Data Source
extension MeAccountDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.snp.remakeConstraints { make in
            make.height.equalTo(Constants.Spacing.small)
        }
        return view
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case Section.sync: return viewModel.lastSyncText
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
}
// MARK: - Delegate
extension MeAccountDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        switch indexPath.section {
        case Section.sync:
            if indexPath.row == 0 {
                viewModel.syncBackup()
            }
        case Section.signout:
            if indexPath.row == 0 {
                viewModel.signout()
            }
        default:
            return
        }
    }
}

