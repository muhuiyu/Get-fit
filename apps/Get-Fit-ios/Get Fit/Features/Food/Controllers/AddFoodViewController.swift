//
//  AddFoodViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit
import RxSwift

class AddFoodViewController: BaseMVVMViewController<AddFoodViewModel> {
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let coordinator = coordinator as? HomeCoordinator else { return }
        coordinator.dismissCurrentModal()
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
        let viewModel = FoodLogViewModel()
        viewModel.foodLog.accept(foodLog)
        let viewController = EditFoodLogViewController(appCoordinator: appCoordinator,
                                                       coordinator: coordinator,
                                                       viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
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
        let iconButton = IconButton(name: Icons.plusCircle)
        iconButton.contentMode = .scaleAspectFit
        iconButton.iconColor = .Brand.primary
        iconButton.tapHandler = { [weak self] in
            self?.didTapQuickAdd(foodLog)
        }
        cell.icons = [iconButton]
        cell.viewTapHandler = { [weak self] in
            self?.didTapInCell(foodLog)
        }
        return cell
    }
}
// MARK: - SearchController
extension AddFoodViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        Task {
            await viewModel.globalSearchFoods(contain: searchText)
        }
    }
}
