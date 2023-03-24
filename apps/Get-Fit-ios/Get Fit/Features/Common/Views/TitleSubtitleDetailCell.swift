//
//  TitleSubtitleDetailCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import UIKit

class TitleSubtitleDetailCell: UITableViewCell {
    static let reuseID = NSStringFromClass(TitleSubtitleDetailCell.self)
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let detailsValueLabel = UILabel()
    
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
    var detailsValue: String? {
        didSet {
            detailsValueLabel.text = detailsValue
        }
    }
    var tapHandler: (() -> Void)?
    
    var titleFont: UIFont? {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    var subtitleFont: UIFont? {
        didSet {
            subtitleLabel.font = subtitleFont
        }
    }
    
    var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    var subtitleColor: UIColor? {
        didSet {
            subtitleLabel.textColor = subtitleColor
        }
    }
    
    var numberOfLinesOfTitle: Int = 1 {
        didSet {
            titleLabel.numberOfLines = numberOfLinesOfTitle
        }
    }
    
    var numberOfLinesOfSubtitle: Int = 1 {
        didSet {
            subtitleLabel.numberOfLines = numberOfLinesOfSubtitle
        }
    }
    
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
extension TitleSubtitleDetailCell {
    @objc
    private func didTapInView(_ sender: UITapGestureRecognizer) {
        tapHandler?()
    }
}

// MARK: - View Config
extension TitleSubtitleDetailCell {
    private func configureViews() {
        titleLabel.text = "title"
        titleLabel.font = .body
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = .body
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        contentView.addSubview(subtitleLabel)
        
        detailsValueLabel.text = "details"
        detailsValueLabel.font = .body
        detailsValueLabel.textColor = .label
        detailsValueLabel.textAlignment = .right
        contentView.addSubview(detailsValueLabel)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.equalTo(contentView.layoutMarginsGuide)
            make.trailing.equalTo(detailsValueLabel.snp.leading)
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.trailing.equalTo(detailsValueLabel.snp.leading)
            make.leading.bottom.equalTo(contentView.layoutMarginsGuide)
        }
        detailsValueLabel.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView(_:)))
        addGestureRecognizer(tapRecognizer)
    }
}

