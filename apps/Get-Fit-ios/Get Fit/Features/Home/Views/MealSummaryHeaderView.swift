//
//  MealSummaryHeaderView.swift
//  Get Fit
//
//  Created by Mu Yu on 9/12/22.
//

import UIKit

class MealSummaryHeaderView: UIView {
    
    private let nameLabel = UILabel()
    private let macroLabel = UILabel()
    private let caloriesLabel = UILabel()
    
    var title: String? {
        didSet {
            nameLabel.text = title
        }
    }
    var macroString: String? {
        didSet {
            macroLabel.text = macroString
        }
    }
    var caloriesString: String? {
        didSet {
            caloriesLabel.text = caloriesString
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
        configureGestures()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - View Config
extension MealSummaryHeaderView {
    private func configureViews() {
        backgroundColor = .secondarySystemBackground
        
        nameLabel.font = UIFont.bodyBold
        nameLabel.textColor = .label
        nameLabel.textAlignment = .left
        addSubview(nameLabel)
        
        macroLabel.font = UIFont.small
        macroLabel.textColor = .secondaryLabel
        macroLabel.textAlignment = .left
        addSubview(macroLabel)
        
        caloriesLabel.font = UIFont.bodyBold
        caloriesLabel.textColor = .label
        caloriesLabel.textAlignment = .right
        addSubview(caloriesLabel)
    }
    private func configureConstraints() {
        nameLabel.snp.remakeConstraints { make in
            make.leading.equalTo(layoutMarginsGuide).inset(Constants.Spacing.small)
            make.trailing.lessThanOrEqualTo(caloriesLabel.snp.leading)
            make.top.equalTo(layoutMarginsGuide)
        }
        macroLabel.snp.remakeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.trailing.lessThanOrEqualTo(caloriesLabel.snp.leading)
            make.bottom.equalTo(layoutMarginsGuide)
        }
        caloriesLabel.snp.remakeConstraints { make in
            make.trailing.equalTo(layoutMarginsGuide).inset(Constants.Spacing.small)
            make.top.bottom.equalTo(layoutMarginsGuide)
            make.centerY.equalToSuperview()
        }
    }
    private func configureGestures() {
        
    }
}

