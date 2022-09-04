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
    
    // MARK: - View
    private let tableView = UITableView()
    var cells: [[UITableViewCell]] = [[UITableViewCell]]()
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.appCoordinator = appCoordinator
        configureNavigationBar()
        configureViews()
        configureConstraints()
        configureSignals()
        
        viewModel.currentDate.accept(Date())
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: - Set bottom bar
//        self.hidesBottomBarWhenPushed = true
//        viewModel.reloadDailyLog(shouldPull: false) {
//
//        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondarySystemBackground
        tableView.allowsSelection = false
        tableView.register(DiaryDateControllCell.self, forCellReuseIdentifier: DiaryDateControllCell.reuseID)
        tableView.register(CaloriesSummaryCell.self, forCellReuseIdentifier: CaloriesSummaryCell.reuseID)
        tableView.register(DoubleUnitsCell.self, forCellReuseIdentifier: DoubleUnitsCell.reuseID)
        tableView.register(TitleSubtitleDetailCell.self, forCellReuseIdentifier: TitleSubtitleDetailCell.reuseID)
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureSignals() {
        viewModel.mealLogs
            .asObservable()
            .subscribe { _ in
                DispatchQueue.main.async {
                    self.configureCells()
                    self.tableView.reloadData()
                }
            }
            .disposed(by: disposeBag)
    }
    private func configureCells() {
        cells.removeAll()
        
        // 0. Date cell
        let dateControlCell = DiaryDateControllCell()
        dateControlCell.date = viewModel.currentDate.value
        dateControlCell.endEditingHandler = { [weak self] in
            self?.didChangeDate(to: dateControlCell.date)
        }
        cells.append([ dateControlCell ])
        
        // 1. Macro summary, Movement, sleep and water intake
        let summaryCell = CaloriesSummaryCell()
        summaryCell.consumedCalories = viewModel.mealLogs.value.totalCalories
        summaryCell.calories = viewModel.getDailyDietaryCaloriesGoal - viewModel.mealLogs.value.totalCalories
        summaryCell.marcoRatios = viewModel.getMacroRatio()
        summaryCell.carbsString = viewModel.getSummaryMacroString(for: .carbs)
        summaryCell.proteinString = viewModel.getSummaryMacroString(for: .protein)
        summaryCell.fatString = viewModel.getSummaryMacroString(for: .fat)
        
        let movementCell = DoubleUnitsCell()
        movementCell.firstUnitConfiguration = viewModel.getCaloriesUnitConfiguration()
        movementCell.secondUnitConfiguration = viewModel.getStepCountUnitConfiguration()
        
        let sleepAndWaterIntakeCell = DoubleUnitsCell()
        sleepAndWaterIntakeCell.firstUnitConfiguration = viewModel.getSleepHoursUnitConfiguration()
        sleepAndWaterIntakeCell.secondUnitConfiguration = viewModel.getWaterIntakeConfiguration()
        
        cells.append([ summaryCell, movementCell, sleepAndWaterIntakeCell ])
        
        // 2+. Meals
        let mealSections: [[UITableViewCell]] = viewModel.mealLogs.value.enumerated().map { mealIndex, mealLog in
            let addFoodLogCell = ButtonCell()
            addFoodLogCell.title = AppText.Home.addFoodLog
            addFoodLogCell.tapHandler = { [weak self] in
                guard let self = self else { return }
                self.didTapAddFoodLog(on: self.viewModel.currentDate.value, forMeal: mealIndex)
            }
            return mealLog.foodLogs.enumerated().compactMap { foodIndex, foodLog in
                guard let food = Food.getFood(for: foodLog.foodID) else { return nil }
                let cell = TitleSubtitleDetailCell()
                cell.title = food.name
                cell.subtitle = "\(String(foodLog.amount)) \(foodLog.unit.rawValue)"
                cell.detailsValue = String(foodLog.calories)
                cell.tapHandler = { [weak self] in
                    guard let self = self else { return }
                    self.didTapFoodLog(for: foodLog,
                                       on: self.viewModel.currentDate.value,
                                        forMeal: mealIndex,
                                        atFood: foodIndex)
                }
                return cell
            } + [ addFoodLogCell ]
        }
        cells += mealSections
        
        // Exercises
        let workouts = viewModel.getWorkouts()
        var exerciseSection = [UITableViewCell]()
        if workouts.isEmpty {
            let cell = UITableViewCell()
            cell.textLabel?.text = AppText.General.noData
            exerciseSection.append(cell)
        } else {
            exerciseSection = workouts.map { workout in
                let cell = TitleSubtitleDetailCell()
                cell.title = workout.name
                cell.subtitle = "\(String(workout.minutes)) \(AppText.Unit.minuteShort)"
                cell.detailsValue = String(workout.calories)
                return cell
            }
        }
        cells.append(exerciseSection)
        
        // Journal
        let journalCell = ButtonCell()
        journalCell.title = "View Journal"
        cells.append([ journalCell ])
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
// MARK: - Handlers
extension HomeViewController {
    private func didTapFoodLog(for foodLog: FoodLog, on date: Date, forMeal mealIndex: Int, atFood foodLogIndex: Int) {
        homeCoordinator?.showFoodLog(for: foodLog, on: date, forMeal: mealIndex, ofFood: foodLogIndex)
    }
    private func didTapAddFoodLog(on date: Date, forMeal mealIndex: Int) {
        homeCoordinator?.showAddFoodLog(on: date, forMeal: mealIndex)
    }
    private func didChangeDate(to value: Date) {
        viewModel.currentDate.accept(value)
    }
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
        let alertControllerOption = BaseCoordinator.AlertControllerOption(title: AppText.General.add,
                                                                          message: nil,
                                                                          preferredStyle: .actionSheet)
        let alertActions = [
            BaseCoordinator.AlertActionOption(title: AppText.Home.addFoodLog, style: .default) { _ in
                self.homeCoordinator?.showAddFoodLog(on: self.viewModel.currentDate.value, forMeal: 1)
            },
            BaseCoordinator.AlertActionOption(title: AppText.Home.addJournal, style: .default) { _ in
            self.homeCoordinator?.showAddJournal()
            },
            BaseCoordinator.AlertActionOption(title: AppText.General.cancel, style: .cancel, handler: nil)
        ]
        
        homeCoordinator?.presentAlert(option: alertControllerOption, actions: alertActions)
    }
}
// MARK: - Data Source and Delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    // Row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    // Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section < viewModel.startIndexOfMealSections { return 0 }
        else { return UITableView.automaticDimension }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section >= viewModel.startIndexOfMealSections else { return nil }
        
        let view = UIView()
        let nameLabel = UILabel()
        nameLabel.font = UIFont.bodyHeavy
        nameLabel.textColor = .label
        nameLabel.textAlignment = .left
        view.addSubview(nameLabel)
        view.backgroundColor = .secondarySystemBackground
        nameLabel.snp.remakeConstraints { make in
            make.leading.equalTo(view.layoutMarginsGuide).inset(Constants.Spacing.small)
            make.top.bottom.equalTo(view.layoutMarginsGuide)
            make.centerY.equalToSuperview()
        }
        
        switch section {
        case viewModel.indexOfExerciseSection:
            nameLabel.text = AppText.Home.exercise
        case viewModel.indexOfJournalSection:
            nameLabel.text = AppText.Home.journal
        default:
            nameLabel.text = "Meal \(String(section-viewModel.startIndexOfMealSections+1))".uppercased()
            
            let caloriesLabel = UILabel()
            caloriesLabel.font = UIFont.bodyHeavy
            caloriesLabel.textColor = .label
            caloriesLabel.textAlignment = .right
            caloriesLabel.text = String(viewModel.getMealCalories(at: section))
            view.addSubview(caloriesLabel)
            
            caloriesLabel.snp.remakeConstraints { make in
                make.trailing.equalTo(view.layoutMarginsGuide).inset(Constants.Spacing.small)
                make.top.bottom.equalTo(view.layoutMarginsGuide)
                make.centerY.equalToSuperview()
            }
        }
        return view
    }
}
