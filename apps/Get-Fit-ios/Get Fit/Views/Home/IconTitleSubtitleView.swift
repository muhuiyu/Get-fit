//
//  IconTitleSubtitleView.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import UIKit

class IconTitleSubtitleView: UIView {
    
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    var iconColor: UIColor = .label {
        didSet {
            iconView.tintColor = iconColor
        }
    }
    var icon: UIImage? {
        didSet {
            iconView.image = icon
        }
    }
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
extension IconTitleSubtitleView {
    private func configureViews() {
        iconView.contentMode = .scaleAspectFit
        addSubview(iconView)
        titleLabel.text = "title"
        titleLabel.textColor = .label
        titleLabel.font = UIFont.desc
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = UIFont.smallHeavy
        subtitleLabel.textColor = .label
        subtitleLabel.textAlignment = .left
        addSubview(subtitleLabel)
    }
    private func configureConstraints() {
        iconView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(Constants.IconButtonSize.slight)
        }
        titleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(Constants.Spacing.small)
            make.top.trailing.equalToSuperview()
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel)
            make.bottom.trailing.equalToSuperview()
        }
    }
    private func configureGestures() {
        
    }
}

