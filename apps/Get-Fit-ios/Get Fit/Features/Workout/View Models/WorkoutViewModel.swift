//
//  WorkoutViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit
import RxSwift
import RxRelay

class WorkoutViewModel: BaseViewModel {
    lazy var dataSource = WorkoutSessionDataSource.dataSource()
    
    // MARK: - Reactive Properties
    private var sessions: BehaviorRelay<WorkoutSessionList> = BehaviorRelay(value: [])
    var displaySessions: BehaviorRelay<[WorkoutSessionSection]> = BehaviorRelay(value: [])
    
    override init() {
        super.init()
        configureSignals()
    }
}
extension WorkoutViewModel {
    var displayTitle: String { AppText.MainTab.workout }
}
extension WorkoutViewModel {
    func reloadSessions() {
        guard let userID = appCoordinator?.userManager.id else { return }
        Task {
            if let sessionsData = await appCoordinator?.dataProvider.getAllWorkoutSessions(for: userID) {
                self.sessions.accept(sessionsData)
            }
        }
    }
    func deleteWorkoutSession(at indexPath: IndexPath) {
        guard
            let userID = appCoordinator?.userManager.id,
            sessions.value.count > indexPath.row
        else { return }
        Task {
            await appCoordinator?.dataProvider.removeWorkoutSession(for: userID, at: sessions.value[indexPath.row].id)
        }
    }
}
// MARK: - Private methods
extension WorkoutViewModel {
    private func configureSignals() {
        self.sessions
            .asObservable()
            .subscribe { _ in
                let sections: [WorkoutSessionSection] = self.sessions.value.groupedByMonth()
                    .map { WorkoutSessionSection(header: $0, items: $1.sortedByTime(isAscending: false)) }
                    .sortedByDate()
                self.displaySessions.accept(sections)
            }
            .disposed(by: disposeBag)
    }
}
