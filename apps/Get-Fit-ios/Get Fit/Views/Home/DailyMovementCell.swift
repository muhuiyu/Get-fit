//
//  DailyMovementCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//
import UIKit

class DailyMovementCell: UITableViewCell {
    static let reuseID = NSStringFromClass(DailyMovementCell.self)
    
    private let caloriesView = TitleSubtitleNumberUnitView()
    private let separatorView = UIView()
    private let stepView = TitleSubtitleNumberUnitView()
    
    var activeCalories: Int = 0 {
        didSet {
            caloriesView.numberString = String(activeCalories)
        }
    }
    var totalCaloriesBurned: Int = 0 {
        didSet {
            caloriesView.noteString = "Total \(String(totalCaloriesBurned)) \(AppText.Unit.kcal)"
        }
    }
    var steps: Int = 0 {
        didSet {
            stepView.numberString = String(steps)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - View Config
extension DailyMovementCell {
    private func configureViews() {
        caloriesView.title = AppText.Home.dailyMovementCellCaloriesTitle
        caloriesView.subtitle = AppText.Home.dailyMovementCellCaloriesSubtitle
        caloriesView.numberStringColor = .red
        caloriesView.unitString = AppText.Unit.kcal
        contentView.addSubview(caloriesView)
        
        separatorView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(separatorView)
        
        stepView.title = AppText.Home.dailyMovementCellStepsTitle
        stepView.subtitle = AppText.Home.dailyMovementCellStepsSubtitle
        stepView.numberStringColor = .green
        stepView.unitString = AppText.Unit.steps
        contentView.addSubview(stepView)
    }
    private func configureConstraints() {
        caloriesView.snp.remakeConstraints { make in
            make.leading.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.trailing.equalTo(separatorView.snp.leading).offset(-Constants.Spacing.small)
        }
        separatorView.snp.remakeConstraints { make in
            make.width.equalTo(1)
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.centerX.equalToSuperview()
        }
        stepView.snp.remakeConstraints { make in
            make.leading.equalTo(separatorView.snp.trailing).offset(Constants.Spacing.small)
            make.top.bottom.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}
