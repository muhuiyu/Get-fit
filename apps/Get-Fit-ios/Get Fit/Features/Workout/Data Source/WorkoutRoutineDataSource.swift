//
//  WorkoutRoutineDataSource.swift
//  Get Fit
//
//  Created by Mu Yu on 5/4/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct WorkoutRoutineDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource

    static func dataSource() -> DataSource<WorkoutRoutineSection> {
        return DataSource<WorkoutRoutineSection>(
            configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutRoutinePreviewCell.reuseID, for: indexPath) as? WorkoutRoutinePreviewCell else {
                    return UITableViewCell()
                }
                cell.viewModel.routine.accept(item)
                return cell

            }, titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )
    }
}




