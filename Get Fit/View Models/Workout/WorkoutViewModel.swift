//
//  WorkoutViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit
import RxSwift
import RxRelay

class WorkoutViewModel {
    private let disposeBag = DisposeBag()
    lazy var dataSource = WorkoutSessionDataSource.dataSource()
    
    // MARK: - Reactive Properties
    private var sessions: BehaviorRelay<WorkoutSessionList> = BehaviorRelay(value: [])
    var displaySessions: BehaviorRelay<[WorkoutSessionSection]> = BehaviorRelay(value: [])
    
    init() {
        configureSignals()
    }
}
extension WorkoutViewModel {
    var displayTitle: String { AppText.MainTab.workout }
}
extension WorkoutViewModel {
    func reloadSessions() {
        // TODO: -
        self.sessions.accept(WorkoutSession.testEntries)
    }
    private func configureSignals() {
        self.sessions
            .asObservable()
            .subscribe { _ in
                let sections: [WorkoutSessionSection] = self.sessions.value.groupedByMonth()
                    .map { WorkoutSessionSection(header: $0, items: $1) }
                    .sortedByDate()
                self.displaySessions.accept(sections)
            }
            .disposed(by: disposeBag)
    }
}
