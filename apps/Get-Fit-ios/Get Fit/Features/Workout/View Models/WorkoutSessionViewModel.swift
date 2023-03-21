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
    var session: BehaviorRelay<WorkoutSession?> = BehaviorRelay(value: nil)
    
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
        updatedSession.itemLogs.append(
            WorkoutItemLog(
                itemID: itemID,
                sets: [ WorkoutSetLog(weight: 0, reps: 0) ],
                restTime: TimeInterval(60))
        )
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
            && indexPath.row <= session.itemLogs[indexPath.section-1].sets.count
    }
    func deleteSet(at indexPath: IndexPath) {
        guard let (indexOfItemLog, indexOfSetLog) = getIndexOfItemLogAndSetLog(at: indexPath) else {
            return
        }
        // Remove set
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs[indexOfItemLog].sets.remove(at: indexOfSetLog)
        
        // Remove workout item if there's no set
        if updatedSession.itemLogs[indexOfItemLog].sets.isEmpty {
            updatedSession.itemLogs.remove(at: indexOfItemLog)
        }
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeItemLogsOrder(to value: [WorkoutItemLog]) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs = value
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
    func didChangeSetType(itemLogAt indexOfItemLog: Int, setLogAt indexOfSetLog: Int, to value: WorkoutSetType) {
        guard var updatedSession = session.value else { return }
        updatedSession.itemLogs[indexOfItemLog].sets[indexOfItemLog].type = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func deleteSession() {
        guard
            let sessionID = session.value?.id,
            let userID = appCoordinator?.userManager.id,
            let dataProvider = appCoordinator?.dataProvider
        else { return }
        
        Task {
            await dataProvider.removeWorkoutSession(for: userID, at: sessionID)
        }
    }
    func saveSession() {
        
    }
}
// MARK: - Private functions
extension WorkoutSessionViewModel {
    private func updateSessionToDatabase() {
        guard
            let session = session.value,
            let userID = appCoordinator?.userManager.id,
            let dataProvider = appCoordinator?.dataProvider
        else { return }
        
        Task {
            await dataProvider.updateWorkoutSession(for: userID, session)
        }
    }
    private func configureSignals() {
        
    }
    private func getIndexOfItemLogAndSetLog(at indexPath: IndexPath) -> (Int, Int)? {
        guard
            let session = session.value,
            !session.itemLogs.isEmpty
        else { return nil }
        return (indexPath.section-1, indexPath.row-1)
    }
}
