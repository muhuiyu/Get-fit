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
    private let titleLabel = UILabel()
    private let caloriesStack = UIStackView()
    private let caloriesLabel = UILabel()
    private let caloriesUnitLabel = UILabel()
    private let ratioBar = UIView()
    private let macroItemView = UIView()
    
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
        titleLabel.text = "default"
        titleLabel.font = UIFont.small
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        caloriesLabel.text = "1000"
        caloriesLabel.font = UIFont.h0
        caloriesLabel.textColor = .label
        caloriesLabel.textAlignment = .left
        caloriesStack.addArrangedSubview(caloriesLabel)
        caloriesUnitLabel.text = "kcal"
        caloriesUnitLabel.font = UIFont.small
        caloriesUnitLabel.textColor = .label
        caloriesUnitLabel.textAlignment = .left
        caloriesStack.addArrangedSubview(caloriesUnitLabel)
        caloriesStack.axis = .horizontal
        caloriesStack.alignment = .firstBaseline
        caloriesStack.spacing = Constants.Spacing.small
        contentView.addSubview(caloriesStack)
        
        // TODO: -
        ratioBar.backgroundColor = .red
        contentView.addSubview(ratioBar)
        macroItemView.backgroundColor = .yellow
        contentView.addSubview(macroItemView)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(contentView.layoutMarginsGuide)
        }
        caloriesStack.snp.remakeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.trivial)
        }
        ratioBar.snp.remakeConstraints { make in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(caloriesStack.snp.bottom).offset(Constants.Spacing.small)
            // TODO: -
            make.height.equalTo(40)
        }
        macroItemView.snp.remakeConstraints { make in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(ratioBar.snp.bottom).offset(Constants.Spacing.small)
            make.bottom.equalTo(contentView.layoutMarginsGuide)
            // TODO: -
            make.height.equalTo(40)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}
