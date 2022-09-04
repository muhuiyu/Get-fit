//
//  IconTitleSubtitleNumberUnitView.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit

class IconTitleSubtitleNumberUnitView: UIView {
    
    private let iconView = UIImageView()
    private let titleStack = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let numberLabel = UILabel()
    private let unitLabel = UILabel()
    private let noteLabel = UILabel()
    
    struct Configuration {
        let icon: UIImage?
        let title: String
        let subtitle: String
        let numberString: String
        let numberStringColor: UIColor
        let unitString: String
        let noteString: String
    }
    var configuration: Configuration? {
        didSet {
            if let configuration = configuration {
                iconView.image = configuration.icon
                iconView.tintColor = configuration.numberStringColor
                titleLabel.text = configuration.title
                subtitleLabel.text = configuration.subtitle
                numberLabel.text = configuration.numberString
                numberLabel.textColor = configuration.numberStringColor
                unitLabel.text = configuration.unitString
                noteLabel.text = configuration.noteString
            }
        }
    }
    var tapHandler: (() -> Void)?
    
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
// MARK: - Handlers
extension IconTitleSubtitleNumberUnitView {
    @objc
    private func didTapInView(_ sender: UITapGestureRecognizer) {
        self.tapHandler?()
    }
}
// MARK: - View Config
extension IconTitleSubtitleNumberUnitView {
    private func configureViews() {
        iconView.contentMode = .scaleAspectFit
        addSubview(iconView)
        titleLabel.text = "title"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleStack.addArrangedSubview(titleLabel)
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = UIFont.small
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        titleStack.addArrangedSubview(subtitleLabel)
        titleStack.axis = .vertical
        titleStack.spacing = Constants.Spacing.slight
        titleStack.alignment = .leading
        addSubview(titleStack)
        numberLabel.text = "number"
        numberLabel.font = UIFont.h2
        numberLabel.textColor = .label
        numberLabel.textAlignment = .left
        addSubview(numberLabel)
        unitLabel.text = "unit"
        unitLabel.font = UIFont.body
        unitLabel.textColor = .label
        unitLabel.textAlignment = .left
        addSubview(unitLabel)
        noteLabel.text = "note"
        noteLabel.font = UIFont.small
        noteLabel.textColor = .secondaryLabel
        noteLabel.textAlignment = .left
        addSubview(noteLabel)
    }
    private func configureConstraints() {
        titleStack.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(layoutMarginsGuide)
        }
        iconView.snp.remakeConstraints { make in
            make.size.equalTo(Constants.IconButtonSize.small)
            make.leading.equalTo(titleLabel)
            make.centerY.equalTo(numberLabel)
        }
        numberLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(Constants.Spacing.small)
            make.leading.equalTo(iconView.snp.trailing).offset(Constants.Spacing.trivial)
        }
        unitLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(numberLabel).inset(Constants.Spacing.trivial)
            make.leading.equalTo(numberLabel.snp.trailing).offset(Constants.Spacing.trivial)
            make.trailing.lessThanOrEqualTo(titleLabel)
        }
        noteLabel.snp.remakeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(Constants.Spacing.trivial)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView(_:)))
        addGestureRecognizer(tapRecognizer)
    }
}

