//
//  WorkoutSessionDataSource.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct WorkoutSessionDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource

    static func dataSource() -> DataSource<WorkoutSessionSection> {
        return DataSource<WorkoutSessionSection>(
            configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutSessionPreviewCell.reuseID, for: indexPath) as? WorkoutSessionPreviewCell else {
                    return UITableViewCell()
                }
                cell.viewModel.session.accept(item)
                return cell

            }, titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )
    }
}




