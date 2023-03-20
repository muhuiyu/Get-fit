//
//  FoodLogCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/29/22.
//

import UIKit

class FoodLogCell: UITableViewCell {
    static let reuseID = NSStringFromClass(FoodLogCell.self)
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let caloriesLabel = UILabel()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    var calories: Int = 0 {
        didSet {
            caloriesLabel.text = String(calories)
        }
    }
    var tapHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
        configureGestures()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Handlers
extension FoodLogCell {
    @objc
    private func didTapInView(_ sender: UITapGestureRecognizer) {
        tapHandler?()
    }
}

// MARK: - View Config
extension FoodLogCell {
    private func configureViews() {
        titleLabel.text = "title"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = UIFont.body
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        contentView.addSubview(subtitleLabel)
        
        caloriesLabel.text = "calories"
        caloriesLabel.font = UIFont.body
        caloriesLabel.textColor = .label
        caloriesLabel.textAlignment = .right
        contentView.addSubview(caloriesLabel)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.equalTo(contentView.layoutMarginsGuide)
            make.trailing.equalTo(caloriesLabel.snp.leading)
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.trailing.equalTo(caloriesLabel.snp.leading)
            make.leading.bottom.equalTo(contentView.layoutMarginsGuide)
        }
        caloriesLabel.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView(_:)))
        addGestureRecognizer(tapRecognizer)
    }
}
