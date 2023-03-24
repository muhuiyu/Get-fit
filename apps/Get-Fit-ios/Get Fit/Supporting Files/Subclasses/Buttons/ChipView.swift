//
//  ChipView.swift
//  Get Fit
//
//  Created by Mu Yu on 3/24/23.
//

import UIKit

class ChipView: UIView {
    private let containerView = UIView()
    private let textLabel = UILabel()
    private let deleteButton = IconButton(name: Icons.xmark)
    
    var deleteButtonTapHandler: (() -> Void)? {
        didSet {
            deleteButton.tapHandler = deleteButtonTapHandler
        }
    }
    
    private let text: String
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Config
extension ChipView {
    private func configureViews() {
        containerView.layer.cornerRadius = 16
        addSubview(containerView)
        textLabel.font = .body
        textLabel.text = text
        textLabel.textAlignment = .left
        textLabel.textColor = .label
        addSubview(textLabel)
        addSubview(deleteButton)
    }
    private func configureConstraints() {
        containerView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        textLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.Spacing.slight)
            make.centerY.equalTo(deleteButton)
        }
        deleteButton.snp.remakeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing)
            make.size.equalTo(10)
            make.centerY.equalToSuperview()
            make.top.bottom.trailing.equalToSuperview().inset(Constants.Spacing.slight)
        }
    }
}
