//
//  WorkoutSetLogCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit

class WorkoutSetLogCell: UITableViewCell {
    static let reuseID = NSStringFromClass(WorkoutSetLogCell.self)
    
    // MARK: - Views
    private let setIndexView = UIView()
    private let setIndexLabel = UILabel()
    private let setIndexCircle = UIView()
    private let weightStack = WorkoutSetLogCellFieldView()
    private let repsStack = WorkoutSetLogCellFieldView()
    private let noteStack = WorkoutSetLogCellFieldView()
    private let moreButton = IconButton(Icons.ellipsis)
    
    var setIndex: Int = 0 {
        didSet {
            setIndexLabel.text = setIndex == 0 ? "" : String(setIndex)
        }
    }
    var setLog: WorkoutSetLog? {
        didSet {
            guard let setLog = setLog else {
                return
            }
            weightStack.value = String(setLog.weight)
            repsStack.value = String(setLog.reps)
            if !setLog.note.isEmpty {
                noteStack.value = setLog.note
            }
        }
    }
    var weightValueChangedHandler: (() -> Void)? {
        didSet {
            weightStack.valueChangedHandler = weightValueChangedHandler
        }
    }
    var repsValueChangedHandler: (() -> Void)? {
        didSet {
            repsStack.valueChangedHandler = repsValueChangedHandler
        }
    }
    var noteValueChangedHandler: (() -> Void)? {
        didSet {
            noteStack.valueChangedHandler = noteValueChangedHandler
        }
    }
    var moreButtonTapHandler: (() -> Void)? {
        didSet {
            moreButton.tapHandler = moreButtonTapHandler
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Interface
extension WorkoutSetLogCell {
    var weight: Double {
        guard
            let rawValue = weightStack.value,
            let value = Double(rawValue) else { return 0 }
        return value
    }
    var reps: Int {
        guard
            let rawValue = repsStack.value,
            let value = Int(rawValue) else { return 0 }
        return value
    }
    var note: String {
        guard let value = noteStack.value else { return "" }
        return value
    }
}
// MARK: - View Config
extension WorkoutSetLogCell {
    private func configureViews() {
        setIndexCircle.layer.borderColor = UIColor.tertiaryLabel.cgColor
        setIndexCircle.layer.borderWidth = 1
        setIndexCircle.layer.cornerRadius = 10
        setIndexView.addSubview(setIndexCircle)
        setIndexLabel.font = UIFont.desc
        setIndexLabel.textColor = .tertiaryLabel
        setIndexLabel.textAlignment = .center
        setIndexView.addSubview(setIndexLabel)
        contentView.addSubview(setIndexView)
        weightStack.title = AppText.Workout.weight
        weightStack.keyboardType = .numbersAndPunctuation
        contentView.addSubview(weightStack)
        repsStack.title = AppText.Workout.reps
        repsStack.keyboardType = .numberPad
        contentView.addSubview(repsStack)
        noteStack.title = AppText.Workout.note
        noteStack.keyboardType = .default
        contentView.addSubview(noteStack)
        moreButton.tintColor = UIColor.Brand.primary
        contentView.addSubview(moreButton)
    }
    private func configureConstraints() {
        setIndexLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }
        setIndexCircle.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(20)
        }
        setIndexView.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.layoutMarginsGuide)
            make.centerY.equalToSuperview()
        }
        weightStack.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(setIndexLabel.snp.trailing).offset(Constants.Spacing.trivial)
            make.width.lessThanOrEqualTo(80)
        }
        repsStack.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(weightStack.snp.trailing)
            make.width.lessThanOrEqualTo(80)
        }
        noteStack.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(repsStack.snp.trailing)
            make.trailing.equalTo(moreButton.snp.leading)
        }
        moreButton.snp.remakeConstraints { make in
            make.size.equalTo(Constants.IconButtonSize.small)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

// MARK: - Field View
class WorkoutSetLogCellFieldView: UIView {
    
    private let titleLabel = UILabel()
    private let textField = UITextField()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var value: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    var valueChangedHandler: (() -> Void)?

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Handlers
extension WorkoutSetLogCellFieldView {
    @objc
    private func didChangeValue(_ : UITextViewDelegate) {
        valueChangedHandler?()
    }
}
// MARK: - View Config
extension WorkoutSetLogCellFieldView {
    private func configureViews() {
        titleLabel.font = UIFont.desc
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        
        textField.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        textField.font = UIFont.smallBold
        textField.textColor = .label
        textField.textAlignment = .left
        addSubview(textField)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.leading.trailing.equalTo(layoutMarginsGuide)
        }
        textField.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.slight)
            make.leading.trailing.bottom.equalTo(layoutMarginsGuide)
        }
    }
}
