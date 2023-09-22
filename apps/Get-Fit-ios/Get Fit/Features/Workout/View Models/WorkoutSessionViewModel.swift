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
    
    override init(appCoordinator: AppCoordinator? = nil) {
        super.init(appCoordinator: appCoordinator)
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
    func addCircuit(for itemIDs: [WorkoutItemID], as type: WorkoutCircuitType) {
        guard var updatedSession = session.value else { return }
        
        switch type {
        case .singleExercise:
            guard let itemID = itemIDs.first else { return }
            updatedSession.circuits.append(
                WorkoutCircuit(
                    id: UUID(),
                    date: updatedSession.startTime.toYearMonthDay,
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: itemID)
                    ])
            )
        case .superSet, .circuit:
            updatedSession.circuits.append(WorkoutCircuit(id: UUID(),
                                                          date: updatedSession.startTime.toYearMonthDay,
                                                          type: .superSet,
                                                          sets: itemIDs.compactMap({ WorkoutSet(itemID: $0) })))
        }
        
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func addWorkItem(to circuitIndex: Int) {
        
    }
    func addSet(for circuitIndex: Int) {
        guard
            var updatedSession = session.value,
            !updatedSession.circuits.isEmpty else { return }
        
        let circuit = updatedSession.circuits[circuitIndex]
        
        switch circuit.type {
        case .superSet:
            let lastGroupOfSet = circuit.lastGroupOfSetsOfSuperSet
            guard !lastGroupOfSet.isEmpty else { return }
            updatedSession.circuits[circuitIndex].sets.addAll(lastGroupOfSet.map({ WorkoutSet(from: $0) }))
        case .singleExercise:
            guard let lastSet = updatedSession.circuits[circuitIndex].sets.last else { return }
            updatedSession.circuits[circuitIndex].sets.append(WorkoutSet(from: lastSet))
        case .circuit:
            return
        }
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func isSetCell(at indexPath: IndexPath) -> Bool {
        guard let session = session.value, !session.circuits.isEmpty else { return false }
        return indexPath.section > 0
            && indexPath.row > 0
            && indexPath.row <= session.circuits[indexPath.section-1].sets.count
    }
    func deleteCircuit(at index: Int) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits.remove(at: index)
        session.accept(updatedSession)
        
        let circuitID = updatedSession.circuits[index].id
        removeCircuitInDatabase(at: circuitID)
    }
    func deleteSet(at indexPath: IndexPath) {
        guard let (circuitIndex, setIndex) = getIndexOfCircuitAndSet(at: indexPath) else { return }
        
        guard var updatedSession = session.value else { return }
        let circuit = updatedSession.circuits[circuitIndex]
        
        // Remove set
        switch circuit.type {
        case .singleExercise, .circuit:
            guard !circuit.sets.isEmpty else { return }
            updatedSession.circuits[circuitIndex].sets.remove(at: setIndex)
        case .superSet:
            guard circuit.sets.count >= circuit.workoutItems.count else { return }
            updatedSession.circuits[circuitIndex].sets.removeLast(circuit.workoutItems.count)
        }
        
        // Remove workout item if there's no set
        if updatedSession.circuits[circuitIndex].sets.isEmpty {
            updatedSession.circuits.remove(at: circuitIndex)
            removeCircuitInDatabase(at: circuit.id)
        }
        
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeCircuitsOrder(to value: [WorkoutCircuit]) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeWeightValue(circuitAt circuitIndex: Int, setAt setIndex: Int, to value: Double) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits[circuitIndex].sets[setIndex].weight = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeRepsValue(circuitAt circuitIndex: Int, setAt setIndex: Int, to value: Int) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits[circuitIndex].sets[setIndex].reps = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeNoteValue(circuitAt circuitIndex: Int, setAt setIndex: Int, to value: String) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits[circuitIndex].sets[setIndex].note = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func didChangeSetType(circuitAt circuitIndex: Int, setAt setIndex: Int, to value: WorkoutSetType) {
        guard var updatedSession = session.value else { return }
        updatedSession.circuits[circuitIndex].sets[setIndex].type = value
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func deleteSession() {
        guard
            let sessionID = session.value?.id,
            let userID = appCoordinator?.userManager.id,
            let dataProvider = appCoordinator?.dataProvider
        else { return }
        
        let result = dataProvider.removeWorkoutSession(for: userID, at: sessionID)
        switch result {
        case .success:
            return
        case .failure(let error):
            ErrorHandler.shared.handle(error)
        }
    }
    func fetchHistory(for circuit: WorkoutCircuit) -> [WorkoutCircuit] {
        guard
            let userID = appCoordinator?.userManager.id,
            let dataProvider = appCoordinator?.dataProvider
        else { return [] }
        return dataProvider.fetchHistory(for: userID, for: circuit)
    }
    func getIndexPath(atCircuit circuitIndex: Int, atSet setIndex: Int) -> IndexPath {
        return IndexPath(row: setIndex+1, section: circuitIndex+1)
    }
    func syncBackup() {
        appCoordinator?.dataProvider.syncBackup()
    }
}
// MARK: - Private functions
extension WorkoutSessionViewModel {
    private func removeCircuitInDatabase(at circuitID: WorkoutCircuitID) {
        guard
            let dataProvider = appCoordinator?.dataProvider
        else { return }
        
        try? dataProvider.removeCircuit(at: circuitID)
    }
    private func updateSessionToDatabase() {
        guard
            let session = session.value,
            let userID = appCoordinator?.userManager.id,
            let dataProvider = appCoordinator?.dataProvider
        else { return }
        
        dataProvider.updateWorkoutSession(for: userID, session)
    }
    private func configureSignals() {
        
    }
    private func getIndexOfCircuitAndSet(at indexPath: IndexPath) -> (Int, Int)? {
        guard
            let session = session.value,
            !session.circuits.isEmpty
        else { return nil }
        return (indexPath.section-1, indexPath.row-1)
    }
}
