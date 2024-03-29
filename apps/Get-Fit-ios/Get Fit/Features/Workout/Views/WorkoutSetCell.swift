//
//  WorkoutSetCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/23/22.
//

import UIKit

class WorkoutSetCell: UITableViewCell {
    static let reuseID = NSStringFromClass(WorkoutSetCell.self)
    
    // MARK: - Views
    private let setIndexView = UIView()
    private let setIndexLabel = UILabel()
    private let setIndexCircle = UIView()
    private let weightStack = WorkoutSetCellFieldView()
    private let repsStack = WorkoutSetCellFieldView()
    private let noteStack = WorkoutSetCellFieldView()
    private let moreButton = IconButton(name: Icons.ellipsis)
    
    // MARK: - Properties
    private let isEditable: Bool
    init(isEditable: Bool = true) {
        self.isEditable = isEditable
        super.init(style: .default, reuseIdentifier: nil)
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
    
    var setIndexString: String? {
        didSet {
            setIndexLabel.text = setIndexString
        }
    }
    var set: WorkoutSet? {
        didSet {
            guard let set = set else {
                return
            }
            weightStack.value = String(set.weight)
            repsStack.value = String(set.reps)
            if !set.note.isEmpty {
                noteStack.value = set.note
            }
        }
    }
    var tapHandler: (() -> Void)?
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Interface
extension WorkoutSetCell {
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
extension WorkoutSetCell {
    private func configureViews() {
        setIndexCircle.layer.borderColor = UIColor.tertiaryLabel.cgColor
        setIndexCircle.layer.borderWidth = 1
        setIndexCircle.layer.cornerRadius = 12
        setIndexView.addSubview(setIndexCircle)
        setIndexLabel.font = UIFont.desc
        setIndexLabel.textColor = .tertiaryLabel
        setIndexLabel.textAlignment = .center
        setIndexView.addSubview(setIndexLabel)
        contentView.addSubview(setIndexView)
        weightStack.title = AppText.Workout.weight
        weightStack.keyboardType = .decimalPad
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
            make.size.equalTo(24)
        }
        setIndexView.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.layoutMarginsGuide)
            make.centerY.equalToSuperview()
        }
        weightStack.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(setIndexLabel.snp.trailing).offset(Constants.Spacing.trivial)
            make.width.lessThanOrEqualTo(70)
        }
        repsStack.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(weightStack.snp.trailing)
            make.width.lessThanOrEqualTo(65)
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
    @objc
    private func didTapInView() {
        tapHandler?()
    }
    private func configureGestures() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInView))
        contentView.addGestureRecognizer(tapRecognizer)
    }
    private func configureSignals() {
        
    }
}

// MARK: - Field View
class WorkoutSetCellFieldView: UIView {
    
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
// MARK: - View Config
extension WorkoutSetCellFieldView: UITextFieldDelegate {
    private func configureViews() {
        titleLabel.font = UIFont.desc
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        
        textField.delegate = self
        textField.font = UIFont.smallMedium
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
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        valueChangedHandler?()
//    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        valueChangedHandler?()
        return true
    }
}
