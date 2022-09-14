//
//  CaloriesSummaryCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit

class CaloriesSummaryCell: UITableViewCell {
    static let reuseID = NSStringFromClass(CaloriesSummaryCell.self)
    
    // MARK: - Views
    private let consumedTitleLabel = UILabel()
    private let consumedCaloriesStack = UIStackView()
    private let consumedCaloriesLabel = UILabel()
    private let consumedCaloriesUnitLabel = UILabel()
    private let titleLabel = UILabel()
    private let caloriesStack = UIStackView()
    private let caloriesLabel = UILabel()
    private let caloriesUnitLabel = UILabel()
    
    private let macroItemStack = UIStackView()
    private let carbsGramView = IconTitleSubtitleView()
    private let proteinGramView = IconTitleSubtitleView()
    private let fatGramView = IconTitleSubtitleView()
    
    private let ratioBar = MacroRatioBarView()

    var consumedCalories: Int = 0 {
        didSet {
            consumedCaloriesLabel.text = String(consumedCalories)
        }
    }
    var calories: Int = 0 {
        didSet {
            caloriesLabel.text = String(calories)
        }
    }
    var carbsString: String? {
        didSet {
            carbsGramView.subtitle = carbsString
        }
    }
    var proteinString: String? {
        didSet {
            proteinGramView.subtitle = proteinString
        }
    }
    var fatString: String? {
        didSet {
            fatGramView.subtitle = fatString
        }
    }
    var marcoRatio: MacroRatio? {
        didSet {
            ratioBar.ratio = marcoRatio
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
extension CaloriesSummaryCell {
    private func configureViews() {
        consumedTitleLabel.text = AppText.Home.consumed
        consumedTitleLabel.font = UIFont.small
        consumedTitleLabel.textColor = .secondaryLabel
        consumedTitleLabel.textAlignment = .left
        contentView.addSubview(consumedTitleLabel)
        consumedCaloriesLabel.text = "1000"
        consumedCaloriesLabel.font = UIFont.h2
        consumedCaloriesLabel.textColor = .label
        consumedCaloriesLabel.textAlignment = .left
        consumedCaloriesStack.addArrangedSubview(consumedCaloriesLabel)
        consumedCaloriesUnitLabel.text = AppText.Unit.kcal
        consumedCaloriesUnitLabel.font = UIFont.small
        consumedCaloriesUnitLabel.textColor = .label
        consumedCaloriesUnitLabel.textAlignment = .left
        consumedCaloriesStack.addArrangedSubview(consumedCaloriesUnitLabel)
        consumedCaloriesStack.axis = .horizontal
        consumedCaloriesStack.alignment = .firstBaseline
        consumedCaloriesStack.spacing = Constants.Spacing.small
        contentView.addSubview(consumedCaloriesStack)
        
        titleLabel.text = AppText.Home.remaining
        titleLabel.font = UIFont.small
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        caloriesLabel.text = "1000"
        caloriesLabel.font = UIFont.h2
        caloriesLabel.textColor = .label
        caloriesLabel.textAlignment = .left
        caloriesStack.addArrangedSubview(caloriesLabel)
        caloriesUnitLabel.text = AppText.Unit.kcal
        caloriesUnitLabel.font = UIFont.small
        caloriesUnitLabel.textColor = .label
        caloriesUnitLabel.textAlignment = .left
        caloriesStack.addArrangedSubview(caloriesUnitLabel)
        caloriesStack.axis = .horizontal
        caloriesStack.alignment = .firstBaseline
        caloriesStack.spacing = Constants.Spacing.small
        contentView.addSubview(caloriesStack)
        
        carbsGramView.title = "carbs"
        carbsGramView.icon = UIImage(systemName: Icons.circleFill)
        carbsGramView.iconColor = .systemGreen
        macroItemStack.addArrangedSubview(carbsGramView)
        proteinGramView.title = "protein"
        proteinGramView.icon = UIImage(systemName: Icons.circleFill)
        proteinGramView.iconColor = .systemOrange
        macroItemStack.addArrangedSubview(proteinGramView)
        fatGramView.title = "fat"
        fatGramView.icon = UIImage(systemName: Icons.circleFill)
        fatGramView.iconColor = .systemYellow
        macroItemStack.addArrangedSubview(fatGramView)
        macroItemStack.axis = .vertical
        macroItemStack.alignment = .leading
        macroItemStack.spacing = Constants.Spacing.small
        contentView.addSubview(macroItemStack)
        contentView.addSubview(ratioBar)
    }
    private func configureConstraints() {
        consumedTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(contentView.layoutMarginsGuide).inset(Constants.Spacing.small)
        }
        consumedCaloriesStack.snp.remakeConstraints { make in
            make.top.equalTo(consumedTitleLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.leading.equalTo(consumedTitleLabel)
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(consumedCaloriesStack.snp.bottom).offset(Constants.Spacing.small)
            make.leading.equalTo(consumedTitleLabel)
        }
        caloriesStack.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.leading.equalTo(consumedTitleLabel)
        }
        macroItemStack.snp.remakeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide)
//            make.leading.equalTo(caloriesStack.snp.trailing).offset(Constants.Spacing.enormous)
            make.leading.equalTo(contentView.snp.centerX)
            make.trailing.greaterThanOrEqualTo(contentView.layoutMarginsGuide)
        }
        ratioBar.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalTo(contentView.layoutMarginsGuide)
            make.top.equalTo(caloriesStack.snp.bottom).offset(Constants.Spacing.medium)
            make.height.equalTo(40)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}
