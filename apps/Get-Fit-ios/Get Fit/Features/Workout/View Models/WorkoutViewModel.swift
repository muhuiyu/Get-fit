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
    
    override init(appCoordinator: AppCoordinator? = nil) {
        super.init(appCoordinator: appCoordinator)
        configureSignals()
    }
}
extension WorkoutViewModel {
    var displayTitle: String { AppText.MainTab.workout }
}
extension WorkoutViewModel {
    func reloadSessions() {
        guard let userID = appCoordinator?.userManager.id else { return }
        if let sessionsData = appCoordinator?.dataProvider.getAllWorkoutSessions(for: userID) {
            self.sessions.accept(sessionsData)
        }
    }
    func deleteWorkoutSession(at indexPath: IndexPath) {
        guard
            let userID = appCoordinator?.userManager.id,
            sessions.value.count > indexPath.row
        else { return }
        let sessionID = displaySessions.value[indexPath.section].items[indexPath.row].id
        let result = appCoordinator?.dataProvider.removeWorkoutSession(for: userID, at: sessionID)
        switch result {
        case .success:
            var updatedSessions = sessions.value
            updatedSessions.removeAll(where: { $0.id == sessionID })
            self.sessions.accept(updatedSessions)
        case .failure(let error):
            ErrorHandler.shared.handle(error)
            return
        case .none:
            return
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
