//
//  WorkoutItemCell.swift
//  Get Fit
//
//  Created by Grace, Mu-Hui Yu on 7/22/23.
//

import Foundation

import UIKit

class WorkoutItemCell: UITableViewCell {
    static let reuseID = NSStringFromClass(WorkoutItemCell.self)
    
    // MARK: - Views
    // TODO: - Change icon
    private let previewImageView = UIImageView(image: UIImage(systemName: Icons.house))
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let infoButton = IconButton(icon: UIImage(systemName: Icons.questionmarkCircle))
    
    var item: WorkoutItem? {
        didSet {
            reconfigureData()
        }
    }
    
    var infoButtonTapHandler: (() -> Void)? {
        didSet {
            infoButton.tapHandler = infoButtonTapHandler
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Config
extension WorkoutItemCell {
    private func configureViews() {
        previewImageView.contentMode = .scaleToFill
        contentView.addSubview(previewImageView)
        titleLabel.font = .bodyBold
        contentView.addSubview(titleLabel)
        subtitleLabel.font = .small
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(infoButton)
    }
    private func configureConstraints() {
        previewImageView.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.layoutMarginsGuide)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.layoutMargins)
            make.leading.equalTo(previewImageView.snp.trailing).offset(Constants.Spacing.small)
            make.trailing.equalTo(infoButton.snp.leading)
        }
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.small)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(contentView.layoutMargins)
        }
        infoButton.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMargins)
            make.size.equalTo(Constants.IconButtonSize.small)
        }
    }
    private func reconfigureData() {
        
    }
}

