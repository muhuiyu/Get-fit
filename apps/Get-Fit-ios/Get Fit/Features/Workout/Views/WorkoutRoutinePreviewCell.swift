//
//  WorkoutRoutinePreviewCell.swift
//  Get Fit
//
//  Created by Mu Yu on 5/4/23.
//

import UIKit
import RxSwift

class WorkoutRoutinePreviewCell: UITableViewCell {
    private let disposeBag = DisposeBag()
    static let reuseID = NSStringFromClass(WorkoutRoutinePreviewCell.self)
    
    // MARK: - Views
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    
    var viewModel = WorkoutRoutineViewModel()
    
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
// MARK: - View Config
extension WorkoutRoutinePreviewCell {
    private func configureViews() {
        titleLabel.text = "default"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        contentView.addSubview(titleLabel)

        contentLabel.text = "default"
        contentLabel.font = UIFont.desc
        contentLabel.textColor = .label
        contentLabel.numberOfLines = 0
        contentView.addSubview(contentLabel)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide)
            make.leading.trailing.equalTo(contentView.layoutMarginsGuide)
        }
        contentLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.small)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func reconfigureCellData(for routine: WorkoutRoutine) {
        titleLabel.text = routine.title
        contentLabel.text = routine.allItemNames
    }

    private func configureSignals() {
        viewModel.routine
            .asObservable()
            .subscribe { value in
                if let value = value {
                    self.reconfigureCellData(for: value)
                }
            }
            .disposed(by: disposeBag)
    }
}
