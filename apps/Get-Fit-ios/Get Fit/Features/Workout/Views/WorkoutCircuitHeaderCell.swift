//
//  WorkoutCircuitHeaderCell.swift
//  Get Fit
//
//  Created by Grace, Mu-Hui Yu on 7/22/23.
//

import UIKit

class WorkoutCircuitHeaderCell: TitleSubtitleButtonCell {
    
    init(circuit: WorkoutCircuit,
         historyButtonTapHandler: (() -> Void)?,
         infoButtonTapHandler: (() -> Void)?) {
        
        super.init(style: .default, reuseIdentifier: nil)
        
        let historyButton = IconButton(name: Icons.clockArrowCirclepath)
        historyButton.tapHandler = historyButtonTapHandler
        historyButton.contentMode = .scaleAspectFit
        historyButton.iconColor = .Brand.primary
        
        let moreButton = IconButton(name: Icons.ellipsis)
        moreButton.tapHandler = infoButtonTapHandler
        moreButton.contentMode = .scaleAspectFit
        moreButton.iconColor = .Brand.primary
        
        icons = [historyButton, moreButton]
        
        switch circuit.type {
        case .singleExercise:
            title = circuit.title
            subtitle = ""
            titleFont = UIFont.bodyMedium
        case .circuit:
            title = AppText.Workout.circuit
            titleColor = UIColor.secondaryLabel
            titleFont = UIFont.small
            subtitle = circuit.customizedTitle
            subtitleColor = UIColor.label
            subtitleFont = UIFont.body
            numberOfLinesOfSubtitle = 0
        case .superSet:
            title = AppText.Workout.superSet
            titleColor = UIColor.secondaryLabel
            titleFont = UIFont.small
            subtitle = circuit.title
            subtitleColor = UIColor.label
            subtitleFont = UIFont.body
            numberOfLinesOfSubtitle = circuit.workoutItems.count
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
