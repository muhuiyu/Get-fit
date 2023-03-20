//
//  DoubleUnitsCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import UIKit

class DoubleUnitsCell: UITableViewCell {
    static let reuseID = NSStringFromClass(DoubleUnitsCell.self)
    
    private let firstUnitView = IconTitleSubtitleNumberUnitView()
    private let separatorView = UIView()
    private let secondUnitView = IconTitleSubtitleNumberUnitView()
    
    var firstUnitConfiguration: IconTitleSubtitleNumberUnitView.Configuration? {
        didSet {
            firstUnitView.configuration = firstUnitConfiguration
        }
    }
    var secondUnitConfiguration: IconTitleSubtitleNumberUnitView.Configuration? {
        didSet {
            secondUnitView.configuration = secondUnitConfiguration
        }
    }
    var firstUnitTapHandler: (() -> Void)?
    var secondUnitTapHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - View Config
extension DoubleUnitsCell {
    private func configureViews() {
        contentView.addSubview(firstUnitView)
        separatorView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(separatorView)
        contentView.addSubview(secondUnitView)
    }
    private func configureConstraints() {
        firstUnitView.snp.remakeConstraints { make in
            make.leading.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.trailing.equalTo(separatorView.snp.leading).offset(-Constants.Spacing.small)
        }
        separatorView.snp.remakeConstraints { make in
            make.width.equalTo(1)
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.centerX.equalToSuperview()
        }
        secondUnitView.snp.remakeConstraints { make in
            make.leading.equalTo(separatorView.snp.trailing).offset(Constants.Spacing.small)
            make.top.bottom.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
}
