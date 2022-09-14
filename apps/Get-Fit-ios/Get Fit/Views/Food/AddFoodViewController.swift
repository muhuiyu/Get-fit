//
//  AddFoodViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit
import RxSwift

class AddFoodViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    
    let viewModel = AddFoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = self.appCoordinator
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
        Task {
            await viewModel.setup()
        }
    }
}
// MARK: - Navigation
extension AddFoodViewController {
    @objc
    private func didTapCancel() {
        homeCoordinator?.dismissCurrentModal()
    }
}
// MARK: - View Config
extension AddFoodViewController {
    private func configureViews() {
        title = AppText.Home.addFoodLog.capitalizeWithAPStyle()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppText.General.search
        navigationItem.searchController = searchController
        
        searchController.searchBar.returnKeyType = .search
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true
        navigationItem.setBarButtonItem(at: .left,
                                        with: AppText.General.cancel,
                                        isBold: false,
                                        target: self,
                                        action: #selector(didTapCancel))
        tableView.register(TitleSubtitleButtonCell.self, forCellReuseIdentifier: TitleSubtitleButtonCell.reuseID)
        tableView.dataSource = self
        tableView.allowsSelection = false
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
        viewModel.displayFoods
            .asObservable()
            .subscribe { _ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - Handlers
extension AddFoodViewController {
    private func didTapInCell(_ foodLog: FoodLog) {
        viewModel.selectFoodLog(foodLog)
    }
    private func didTapQuickAdd(_ foodLog: FoodLog) {
        viewModel.quickAddFoodLog(foodLog)
    }
}

// MARK: - Data Source
extension AddFoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.displayFoods.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodLog = viewModel.displayFoods.value[indexPath.row]
        let cell = TitleSubtitleButtonCell()
        if let item = Food.getItem(of: foodLog.foodID) {
            cell.title = item.name
        }
        cell.icon = UIImage(systemName: Icons.plusCircle)
        cell.tapHandler = { [weak self] in
            self?.didTapInCell(foodLog)
        }
        cell.buttonTapHandler = { [weak self] in
            self?.didTapQuickAdd(foodLog)
        }
        return cell
    }
}
// MARK: - SearchController
extension AddFoodViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        Task {
            await viewModel.globalSearchFoods(contain: searchText)
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filterOptionForSearchText(searchText)
    }
    func filterOptionForSearchText(_ searchText: String) {
        viewModel.filterOptions(for: searchText)
    }
}
