//
//  TitleSubtitleNumberUnitView.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit

class TitleSubtitleNumberUnitView: UIView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let numberLabel = UILabel()
    private let unitLabel = UILabel()
    private let noteLabel = UILabel()
    
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
    var numberString: String? {
        didSet {
            numberLabel.text = numberString
        }
    }
    var numberStringColor: UIColor = .label {
        didSet {
            numberLabel.textColor = numberStringColor
        }
    }
    var unitString: String? {
        didSet {
            unitLabel.text = unitString
        }
    }
    var noteString: String? {
        didSet {
            noteLabel.text = noteString
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
extension TitleSubtitleNumberUnitView {
    @objc
    private func didTapInView(_ sender: UITapGestureRecognizer) {
        self.tapHandler?()
    }
}
// MARK: - View Config
extension TitleSubtitleNumberUnitView {
    private func configureViews() {
        titleLabel.text = "title"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        subtitleLabel.text = "subtitle"
        subtitleLabel.font = UIFont.small
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        addSubview(subtitleLabel)
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
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(layoutMarginsGuide)
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.slight)
            make.leading.trailing.equalTo(titleLabel)
        }
        numberLabel.snp.remakeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(Constants.Spacing.small)
            make.leading.equalTo(titleLabel)
        }
        unitLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(numberLabel)
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

