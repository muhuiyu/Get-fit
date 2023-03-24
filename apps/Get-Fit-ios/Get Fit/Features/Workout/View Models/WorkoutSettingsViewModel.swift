//
//  WorkoutSettingsViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 3/22/23.
//

import UIKit
import RxSwift
import RxRelay

class WorkoutSettingsViewModel: BaseViewModel {
    var cells: [[UITableViewCell]] = []
    
    override init() {
        super.init()
        configureCells()
    }
    
    enum Cell: Int, CaseIterable {
        case editExercise = 0
        case editCategory
        case editRoutine
        
        var name: String {
            switch self {
            case .editExercise:
                return AppText.Workout.editExercise
            case .editCategory:
                return AppText.Workout.editCategory
            case .editRoutine:
                return AppText.Workout.editRoutine
            }
        }
        
        var cell: UITableViewCell {
            let cell = UITableViewCell()
            cell.accessoryType = .disclosureIndicator
            var content = cell.defaultContentConfiguration()
            content.text = name
            cell.contentConfiguration = content
            return cell
        }
        
        var sectionIndex: Int {
            return rawValue
        }
    }
}

extension WorkoutSettingsViewModel {
    private func configureCells() {
        Cell.allCases.forEach { cells.append([ $0.cell ]) }
    }
}

