//
//  TitleSubtitleButtonCell.swift
//  Get Fit
//
//  Created by Mu Yu on 9/10/22.
//

import UIKit

class TitleSubtitleButtonCell: UITableViewCell {
    static let reuseID = NSStringFromClass(TitleSubtitleButtonCell.self)
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let cellTappingArea = UIView()
    private let iconsView = UIView()
    
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
    
    var icons: [IconButton] = [] {
        didSet {
            reconfigureIconsView()
        }
    }
    
    var viewTapHandler: (() -> Void)?
    
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
extension TitleSubtitleButtonCell {
    @objc
    private func didTapInView(_ sender: UITapGestureRecognizer) {
        viewTapHandler?()
    }
}

// MARK: - View Config
extension TitleSubtitleButtonCell {
    private func configureViews() {
        titleLabel.text = "title"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = .body
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        contentView.addSubview(subtitleLabel)
        
        contentView.addSubview(iconsView)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.equalTo(contentView.layoutMarginsGuide)
            make.trailing.lessThanOrEqualTo(iconsView.snp.leading)
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.trailing.lessThanOrEqualTo(iconsView.snp.leading)
            make.leading.bottom.equalTo(contentView.layoutMarginsGuide)
        }
        iconsView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMarginsGuide).inset(Constants.Spacing.slight)
        }
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView(_:)))
        addGestureRecognizer(tapRecognizer)
    }
    private func reconfigureIconsView() {
        iconsView.subviews.forEach({ $0.removeFromSuperview() })
        guard !icons.isEmpty else { return }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.Spacing.trivial
        stackView.alignment = .center
        icons.forEach { stackView.addArrangedSubview($0) }
        iconsView.addSubview(stackView)
        stackView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.Spacing.trivial)
        }
    }
}


