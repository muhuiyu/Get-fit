//
//  DiaryDateControllCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import UIKit

class DiaryDateControllCell: UITableViewCell {
    static let reuseID = NSStringFromClass(DiaryDateControllCell.self)
    
    private let datePicker = UIDatePicker()
    private let previousDayButton = IconButton(name: Icons.chevronBackward)
    private let nextDayButton = IconButton(name: Icons.chevronForward)
    
    var date: Date {
        get { return datePicker.date }
        set { datePicker.date = newValue }
    }
    var endEditingHandler: (() -> Void)?
    
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
// MARK: - Selectors
extension DiaryDateControllCell {
    @objc
    private func didEndEditingHandler(_ sender: UIDatePicker) {
        self.endEditingHandler?()
    }
    private func didTapPreviousDay() {
        datePicker.date = datePicker.date.dayBefore
        self.endEditingHandler?()
    }
    private func didTapNextDay() {
        datePicker.date = datePicker.date.dayAfter
        self.endEditingHandler?()
    }
}
// MARK: - View Config
extension DiaryDateControllCell {
    private func configureViews() {
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(didEndEditingHandler(_:)), for: .editingDidEnd)
        contentView.addSubview(datePicker)
        
        previousDayButton.iconColor = .secondaryLabel
        previousDayButton.contentMode = .scaleAspectFit
        previousDayButton.isUserInteractionEnabled = true
        previousDayButton.tapHandler = { [weak self] in
            self?.didTapPreviousDay()
        }
        contentView.addSubview(previousDayButton)
        
        nextDayButton.iconColor = .secondaryLabel
        nextDayButton.contentMode = .scaleAspectFit
        nextDayButton.isUserInteractionEnabled = true
        nextDayButton.tapHandler = { [weak self] in
            self?.didTapNextDay()
        }
        contentView.addSubview(nextDayButton)
    }
    private func configureConstraints() {
        datePicker.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.center.equalToSuperview()
        }
        previousDayButton.snp.remakeConstraints { make in
            make.size.equalTo(Constants.IconButtonSize.small)
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.layoutMarginsGuide)
        }
        nextDayButton.snp.remakeConstraints { make in
            make.size.equalTo(Constants.IconButtonSize.small)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
}

