//
//  MacroRatioBarView.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

import UIKit

class MacroRatioBarView: UIView {
    
    private let emptyStateLabel = UILabel()
    private let carbsLabel = UILabel()
    private let carbsView = UIView()
    private let proteinLabel = UILabel()
    private let proteinView = UIView()
    private let fatLabel = UILabel()
    private let fatView = UIView()

    var ratio: MacroRatio? {
        didSet {
            guard
                let ratio = ratio, !ratio.isEmpty else {
                carbsView.isHidden = true
                proteinView.isHidden = true
                fatView.isHidden = true
                emptyStateLabel.isHidden = false
                return
            }
            carbsLabel.text = "carbs \(String(Int((ratio.carbs * 100).rounded()))) %"
            proteinLabel.text = "protein \(String(Int((ratio.protein * 100).rounded()))) %"
            fatLabel.text = "fat \(String(Int((ratio.fat * 100).rounded()))) %"
            carbsView.snp.remakeConstraints { make in
                make.leading.top.bottom.equalToSuperview()
                make.height.equalTo(40)
                make.width.equalToSuperview().multipliedBy(ratio.carbs)
            }
            proteinView.snp.remakeConstraints { make in
                make.top.bottom.equalTo(carbsView)
                make.leading.equalTo(carbsView.snp.trailing)
                make.width.equalToSuperview().multipliedBy(ratio.protein)
            }
            fatView.snp.remakeConstraints { make in
                make.top.bottom.equalTo(carbsView)
                make.leading.equalTo(proteinView.snp.trailing)
                make.trailing.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(ratio.fat)
            }
        }
    }
    
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
// MARK: - View Config
extension MacroRatioBarView {
    private func configureViews() {
        emptyStateLabel.text = AppText.Home.noData
        emptyStateLabel.textColor = .tertiaryLabel
        emptyStateLabel.font = UIFont.small
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.isHidden = true
        addSubview(emptyStateLabel)
        
        carbsLabel.textAlignment = .center
        carbsLabel.font = UIFont.small
        carbsLabel.textColor = .white
        carbsView.addSubview(carbsLabel)
        carbsView.backgroundColor = .systemGreen
        carbsView.clipsToBounds = true
        addSubview(carbsView)
        proteinLabel.textAlignment = .center
        proteinLabel.font = UIFont.small
        proteinLabel.textColor = .white
        proteinView.addSubview(proteinLabel)
        proteinView.backgroundColor = .systemOrange
        proteinView.clipsToBounds = true
        addSubview(proteinView)
        fatLabel.textAlignment = .center
        fatLabel.font = UIFont.small
        fatLabel.textColor = .white
        fatView.addSubview(fatLabel)
        fatView.backgroundColor = .systemYellow
        fatView.clipsToBounds = true
        addSubview(fatView)
        
        backgroundColor = .systemGray6
    }
    private func configureConstraints() {
        emptyStateLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        carbsLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        carbsView.snp.remakeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        proteinLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        proteinView.snp.remakeConstraints { make in
            make.top.bottom.equalTo(carbsView)
            make.leading.equalTo(carbsView.snp.trailing)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        fatLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        fatView.snp.remakeConstraints { make in
            make.top.bottom.equalTo(carbsView)
            make.leading.equalTo(proteinView.snp.trailing)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
        }
    }
    private func configureGestures() {
        
    }
}

