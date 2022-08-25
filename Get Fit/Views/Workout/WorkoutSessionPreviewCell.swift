//
//  WorkoutSessionPreviewCell.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit
import RxSwift

class WorkoutSessionPreviewCell: UITableViewCell {
    private let disposeBag = DisposeBag()
    static let reuseID = NSStringFromClass(WorkoutSessionPreviewCell.self)
    
    // MARK: - Views
    private let dateStack = UIStackView()
    private let weekdayLabel = UILabel()
    private let dayLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let durationLabel = UILabel()
    
    var viewModel = WorkoutSessionViewModel()
    
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
extension WorkoutSessionPreviewCell {
    private func configureViews() {
        weekdayLabel.text = "Sat"
        weekdayLabel.font = UIFont.desc
        weekdayLabel.textColor = .secondaryLabel
        dateStack.addArrangedSubview(weekdayLabel)
        
        dayLabel.text = "01"
        dayLabel.font = UIFont.bodyHeavy
        dayLabel.textColor = .label
        dateStack.addArrangedSubview(dayLabel)
        
        dateStack.axis = .vertical
        dateStack.spacing = Constants.Spacing.slight
        dateStack.alignment = .center
        contentView.addSubview(dateStack)
        
        titleLabel.text = "default"
        titleLabel.font = UIFont.body
        titleLabel.textColor = .label
        contentView.addSubview(titleLabel)

        contentLabel.text = "default"
        contentLabel.font = UIFont.small
        contentLabel.textColor = .label
        contentLabel.numberOfLines = 0
        contentView.addSubview(contentLabel)
        
        durationLabel.text = "34 min"
        durationLabel.font = UIFont.desc
        durationLabel.textColor = .secondaryLabel
        durationLabel.textAlignment = .right
        contentView.addSubview(durationLabel)
    }
    private func configureConstraints() {
        dateStack.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.layoutMarginsGuide)
            make.centerY.equalTo(contentView)
            make.width.lessThanOrEqualTo(50)
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide)
            make.leading.equalTo(dateStack.snp.trailing).offset(Constants.Spacing.medium)
            make.trailing.equalTo(durationLabel.snp.leading)
        }
        contentLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.small)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(contentView.layoutMarginsGuide)
        }
        durationLabel.snp.remakeConstraints { make in
            make.bottom.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        viewModel.displayTitleString
            .asObservable()
            .subscribe { value in
                self.titleLabel.text = value
            }
            .disposed(by: disposeBag)
        
        viewModel.displayContentString
            .asObservable()
            .subscribe { value in
                self.contentLabel.text = value
            }
            .disposed(by: disposeBag)
        
        viewModel.displayDayString
            .asObservable()
            .subscribe { value in
                self.dayLabel.text = value
            }
            .disposed(by: disposeBag)
        
        viewModel.displayWeekdayString
            .asObservable()
            .subscribe { value in
                self.weekdayLabel.text = value
            }
            .disposed(by: disposeBag)
        
        viewModel.displayDurationString
            .asObservable()
            .subscribe { value in
                self.durationLabel.text = value
            }
            .disposed(by: disposeBag)
    }
}
