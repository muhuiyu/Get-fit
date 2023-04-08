//
//  MeGoalsViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 4/7/23.
//

import UIKit
import RxSwift

class MeGoalViewController: BaseMVVMViewController<MeGoalViewModel> {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private var cells: [[UITableViewCell]] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override init(appCoordinator: AppCoordinator? = nil, coordinator: BaseCoordinator? = nil, viewModel: MeGoalViewModel) {
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
extension MeGoalViewController {
    struct Section {
        static let weight = 0
        static let nutrition = 1
        static let fitness = 2
    }
    
    private func configureCells() {
        cells.removeAll()
        let weightSection = configureWeightSection()
        cells.append(weightSection)
        let nutritionSection = configureNutritionSection()
        cells.append(nutritionSection)
        let fitnessSection = configureFitnessSection()
        cells.append(fitnessSection)
    }
    
    private func configureWeightSection() -> [UITableViewCell] {
        let startingWeightCell = UITableViewCell(style: .value1, reuseIdentifier: nil)   // indexPath (0, 0)
        var startingWeightContent = startingWeightCell.defaultContentConfiguration()
        startingWeightContent.text = AppText.Me.startingWeight
        startingWeightContent.secondaryText = String(viewModel.startingWeight)
        startingWeightCell.contentConfiguration = startingWeightContent

        let currentWeightCell = UITableViewCell(style: .value1, reuseIdentifier: nil)   // indexPath (0, 1)
        var currentWeightContent = currentWeightCell.defaultContentConfiguration()
        currentWeightContent.text = AppText.Me.currentWeight
        currentWeightContent.secondaryText = String(viewModel.currentWeight)
        currentWeightCell.contentConfiguration = currentWeightContent
        
        let goalWeightCell = UITableViewCell(style: .value1, reuseIdentifier: nil)   // indexPath (0, 2)
        var goalWeightContent = goalWeightCell.defaultContentConfiguration()
        goalWeightContent.text = AppText.Me.goalWeight
        goalWeightContent.secondaryText = String(viewModel.goalWeight)
        goalWeightCell.contentConfiguration = goalWeightContent
        
        return [ startingWeightCell, currentWeightCell, goalWeightCell ]
    }
    
    private func configureNutritionSection() -> [UITableViewCell] {
        let macroCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)   // indexPath (1, 0)
        var macroContent = macroCell.defaultContentConfiguration()
        macroContent.text = AppText.Me.caloriesAndMacroGoalsTitle
        macroContent.secondaryText = AppText.Me.caloriesAndMacroGoalsSubtitle
        macroCell.contentConfiguration = macroContent
        macroCell.accessoryType = .disclosureIndicator
        
        let otherCell = UITableViewCell()   // indexPath (1, 0)
        var otherContent = otherCell.defaultContentConfiguration()
        otherContent.text = AppText.Me.additionalNutrientGoals
        otherCell.contentConfiguration = otherContent
        otherCell.accessoryType = .disclosureIndicator
        
        return [ macroCell, otherCell ]
    }

    private func configureFitnessSection() -> [UITableViewCell] {
        let cell = UITableViewCell()   // indexPath (2, 0)
        var content = cell.defaultContentConfiguration()
        content.text = AppText.Me.fitnessGoals
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
extension MeGoalViewController: UITableViewDataSource {
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
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case Section.nutrition: return AppText.Me.nutritionGoals
        case Section.fitness: return AppText.Me.fitnessGoals
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
}
// MARK: - Delegate
extension MeGoalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        switch indexPath.section {
        case Section.weight:
            determineDestinationOfWeightSection(at: indexPath.row)
        case Section.nutrition:
            determineDestinationOfNutritionSection(at: indexPath.row)
        case Section.fitness:
            determineDestinationOfFitnessSection(at: indexPath.row)
        default:
            return
        }
    }
    private func determineDestinationOfWeightSection(at index: Int) {
        // TODO: -
    }
    private func determineDestinationOfNutritionSection(at index: Int) {
        // TODO: -
    }
    private func determineDestinationOfFitnessSection(at index: Int) {
        // TODO: -
    }
}



