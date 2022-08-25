//
//  MeViewController.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class MeViewController: BaseViewController {
    
    private let tableView = UITableView()
    
    private var cells: [[UITableViewCell]] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var viewModel = MeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        configureViews()
        configureConstraints()
        configureSignals()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.hidesBottomBarWhenPushed = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
}
// MARK: - Handlers
extension MeViewController {
    @objc
    private func didTapSettings() {
        // TODO: - Add settings page
        print("didTapSettings")
    }
}
// MARK: - View Config
extension MeViewController {
    private func configureViews() {
        title = viewModel.displayTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icons.gearshape),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapSettings))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureSignals() {
        
    }
}
// MARK: - Configure Cells
extension MeViewController {
    private func configureCells() {
        cells.removeAll()
        let accountSection = configureAccountSection()
        cells.append(accountSection)
        let generalFunctionsSection = configureGeneralFunctionsSection()
        cells.append(generalFunctionsSection)
        let customizedDataSection = configureCustomizedDataSection()
        cells.append(customizedDataSection)
        let feedbackSection = configureFeedbackSection()
        cells.append(feedbackSection)
    }
    private func configureAccountSection() -> [UITableViewCell] {
        let emailCell = UITableViewCell()   // indexPath (0, 0)
        emailCell.accessoryType = .disclosureIndicator
        emailCell.textLabel?.text = viewModel.userEmail
        // username, email, logout in the viewController
        return [emailCell]
    }
    private func configureGeneralFunctionsSection() -> [UITableViewCell] {
        let goalsCell = UITableViewCell()
        goalsCell.textLabel?.text = AppText.Me.goals
        goalsCell.accessoryType = .disclosureIndicator
        let remindersCell = UITableViewCell()
        remindersCell.textLabel?.text = AppText.Me.reminders
        remindersCell.accessoryType = .disclosureIndicator
        let appAndServicesCell = UITableViewCell()
        appAndServicesCell.textLabel?.text = AppText.Me.appAndServices
        appAndServicesCell.accessoryType = .disclosureIndicator
        return [ goalsCell, remindersCell, appAndServicesCell ]
    }
    private func configureCustomizedDataSection() -> [UITableViewCell] {
        let editExercisesCell = UITableViewCell()
        editExercisesCell.textLabel?.text = AppText.Me.editExercises
        editExercisesCell.accessoryType = .disclosureIndicator
        let editMealsCell = UITableViewCell()
        editMealsCell.textLabel?.text = AppText.Me.editMeals
        editMealsCell.accessoryType = .disclosureIndicator
        let editRecipesCell = UITableViewCell()
        editRecipesCell.textLabel?.text = AppText.Me.editRecipes
        editRecipesCell.accessoryType = .disclosureIndicator
        return [ editExercisesCell, editMealsCell, editRecipesCell ]
    }
    private func configureFeedbackSection() -> [UITableViewCell] {
        let sendFeedbackCell = UITableViewCell()
        sendFeedbackCell.textLabel?.text = AppText.Me.sendFeedback
        sendFeedbackCell.accessoryType = .disclosureIndicator
        let helpAndSupportCell = UITableViewCell()
        helpAndSupportCell.textLabel?.text = AppText.Me.helpAndSupport
        helpAndSupportCell.accessoryType = .disclosureIndicator
        return [ sendFeedbackCell, helpAndSupportCell ]
    }
}
// MARK: - Data Source
extension MeViewController: UITableViewDataSource {
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
}
// MARK: - Delegate
extension MeViewController: UITableViewDelegate {
    struct Section {
        static let account = 0
        static let general = 1
        static let customizedData = 2
        static let feedback = 3
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        switch indexPath.section {
        case Section.account:
            if indexPath.row == 0 {
                self.meCoordinator?.showAccountDetails()
            }
        case Section.general:
            determineDestinationOfGenernalSection(at: indexPath.row)
        case Section.customizedData:
            determineDestinationOfCustomizedDataSection(at: indexPath.row)
        case Section.feedback:
            determineDestinationOfFeedbackSection(at: indexPath.row)
        default:
            return
        }
    }
    private func determineDestinationOfGenernalSection(at row: Int) {
        // goals, reminders, appAndServices
        switch row {
        case 0:
            return
        case 1:
            return
        case 2:
            return
        default:
            return
        }
    }
    private func determineDestinationOfCustomizedDataSection(at row: Int) {
        // edit exercises, edit meals, edit recipes
        switch row {
        case 0:
            return
        case 1:
            return
        case 2:
            return
        default:
            return
        }
    }
    private func determineDestinationOfFeedbackSection(at row: Int) {
        // send feedback, help and support
        switch row {
        case 0:
            return
        case 1:
            return
        default:
            return
        }
    }
}

