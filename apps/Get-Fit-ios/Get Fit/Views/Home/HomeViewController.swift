//
//  HomeViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/20/22.
//

import UIKit
import RxSwift

class HomeViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    // tabs: home (dashboard), food/fasting, workout, progress, settings
    // calories and macros summary
    // steps | active calories and total calories
    // sleep hours | water intake
    // food diary: <add meal> button -> next page
    // add journal (note)
    //
    
    // MARK: - View
    private let tableView = UITableView()
    var viewModel = HomeViewModel()
    
//    var transactionListViewModel = TransactionListViewModel()
//    let reloadOption: TransactionListViewModel.ReloadTransactionsOption = .inRecentThirtyDays

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadDailyLog(shouldPull: true) {
            self.configureNavigationBar()
            self.configureViews()
            self.configureConstraints()
            self.configureSignals()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: - Set bottom bar
//        self.hidesBottomBarWhenPushed = true
        viewModel.reloadDailyLog(shouldPull: false) {
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
}
// MARK: - TapHandlers
extension HomeViewController {
    @objc
    func didTapOnNotification(_ sender: UIBarButtonItem) {
        homeCoordinator?.showNotifications()
    }
    @objc
    func didPullToRefresh(_ sender: UIRefreshControl) {
//        refreshControl.beginRefreshing()
//        transactionListViewModel.reloadTransactions(reloadOption, shouldPull: true) {
//            self.refreshControl.endRefreshing()
//        }
    }
    @objc
    private func didTapAdd(_ sender: UIBarButtonItem) {
        let alertControllerOption = BaseCoordinator.AlertControllerOption(title: "Add",
                                                                          message: nil,
                                                                          preferredStyle: .actionSheet)
        let alertActions = [
            BaseCoordinator.AlertActionOption(title: AppText.Home.addFoodLog, style: .default) { _ in
                self.homeCoordinator?.showAddFoodLog()
            },
            BaseCoordinator.AlertActionOption(title: AppText.Home.addFoodLog, style: .default) { _ in
                self.homeCoordinator?.showAddJournal()
            },
            BaseCoordinator.AlertActionOption(title: "Cancel", style: .cancel, handler: nil)
        ]
        
        homeCoordinator?.presentAlert(option: alertControllerOption, actions: alertActions)
    }
}
// MARK: - View Config
extension HomeViewController {
    private func configureNavigationBar() {
        title = viewModel.displayTitle
        let notificationItem = UIBarButtonItem(image: UIImage(systemName: Icons.bellbadgeFill),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapOnNotification(_ :)))
        let addItem = UIBarButtonItem(image: UIImage(systemName: Icons.plus),
                                      style: .plain,
                                      target: self,
                                      action: #selector(didTapAdd(_ :)))
        navigationItem.rightBarButtonItems = [ notificationItem, addItem ]
    }

    private func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CaloriesSummaryCell.self, forCellReuseIdentifier: CaloriesSummaryCell.reuseID)
        tableView.register(DailyMovementCell.self, forCellReuseIdentifier: DailyMovementCell.reuseID)
        // TODO: - Register the rest of cells
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureSignals() {
        viewModel.displayCells
            .asObservable()
            .subscribe { _ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - Data Source
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.displayCells.value.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.displayCells.value[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.displayCells.value[indexPath.section][indexPath.row]
    }
}
// MARK: - Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        print(indexPath)
    }
}
