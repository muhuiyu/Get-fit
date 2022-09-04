//
//  WorkoutSessionViewModel.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import UIKit
import RxSwift
import RxRelay

class WorkoutSessionViewModel: BaseViewModel {
    private let disposeBag = DisposeBag()
    
    var session: BehaviorRelay<WorkoutSession?> = BehaviorRelay(value: nil)
    var displayTitleString: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayContentString: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayDayString: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayWeekdayString: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayDurationString: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    override init() {
        super.init()
        configureSignals()
    }
}
// MARK: - Update Data
extension WorkoutSessionViewModel {
    func didChangeTitleValue(to value: String?) {
        guard
            let value = value,
            var updatedSession = session.value else {
            return
        }
        updatedSession.title = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeStartTime(to value: DateAndTime) {
        guard
            var updatedSession = session.value else {
            return
        }
        updatedSession.startTime = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeEndTime(to value: DateAndTime) {
        guard
            var updatedSession = session.value else {
            return
        }
        updatedSession.endTime = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
}
// MARK: - Update exercise and sets
extension WorkoutSessionViewModel {
    func addExercise(for itemID: WorkoutItemID) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs.append(WorkoutItemLog(itemID: itemID, sets: [
            WorkoutSetLog(weight: 0, reps: 0)
        ]))
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func addSet(for indexOfItemLog: Int) {
        guard
            var updatedSession = session.value,
            !updatedSession.itemLogs.isEmpty,
            let lastSet = updatedSession.itemLogs[indexOfItemLog].sets.last else { return }
        
        updatedSession.itemLogs[indexOfItemLog].sets.append(lastSet)
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func isSetLogCell(at indexPath: IndexPath) -> Bool {
        guard let session = session.value, !session.itemLogs.isEmpty else { return false }
        return indexPath.section > 0
            && indexPath.row > 0
            && indexPath.row < session.itemLogs.count
    }
    func deleteSet(at indexPath: IndexPath) {
        guard let (indexOfItemLog, indexOfSetLog) = getIndexOfItemLogAndSetLog(at: indexPath) else {
            return
        }
        guard var updatedSession = session.value else { return }
        // TODO: - Check the bug here
        updatedSession.itemLogs[indexOfItemLog].sets.remove(at: indexOfSetLog)
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeWeightValue(itemLogAt indexOfItemLog: Int, setLogAt indexOfSetLog: Int, to value: Double) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs[indexOfItemLog].sets[indexOfItemLog].weight = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeRepsValue(itemLogAt indexOfItemLog: Int, setLogAt indexOfSetLog: Int, to value: Int) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs[indexOfItemLog].sets[indexOfItemLog].reps = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeNoteValue(itemLogAt indexOfItemLog: Int, setLogAt indexOfSetLog: Int, to value: String) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs[indexOfItemLog].sets[indexOfItemLog].note = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
}
// MARK: - Private functions
extension WorkoutSessionViewModel {
    private func updateSessionToDatabase() {
        // TODO: -
        print("will update session to database")
    }
    private func configureSignals() {
        session
            .asObservable()
            .subscribe(onNext: { value in
                if let value = value {
                    self.displayTitleString.accept(value.title)
                    self.displayContentString.accept("will be updated soon")     // TODO: - update displayText
                    self.displayDayString.accept(String(value.startTime.day))
                    self.displayWeekdayString.accept(value.startTime.toDate()?.toWeekDayString() ?? "")
                    self.displayDurationString.accept(value.durationInHourMinuteString)
                }
            })
            .disposed(by: disposeBag)
    }
    private func getIndexOfItemLogAndSetLog(at indexPath: IndexPath) -> (Int, Int)? {
        guard
            let session = session.value,
            !session.itemLogs.isEmpty
        else { return nil }
        return (indexPath.section-1, indexPath.row)
    }
}
