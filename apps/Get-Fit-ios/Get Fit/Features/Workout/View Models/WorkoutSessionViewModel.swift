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
    func addCircuit(for itemIDs: [WorkoutItemID], as type: WorkoutCircuitType) {
        guard var updatedSession = session.value else { return }
        
        switch type {
        case .singleExercise:
            guard let itemID = itemIDs.first else { return }
            updatedSession.circuits.append(
                WorkoutCircuit(type: .singleExercise,
                               sets: [
                                WorkoutSet(itemID: itemID, type: .normal, weight: 0, reps: 0, restTime: TimeInterval(30), note: "")
                               ])
            )
        case .superSet, .circuit:
            updatedSession.circuits.append(WorkoutCircuit(type: .superSet,
                                                          sets: itemIDs.compactMap({ WorkoutSet(itemID: $0, type: .normal, weight: 0, reps: 0, restTime: TimeInterval(30), note: "") })))
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
            updatedSession.circuits[circuitIndex].sets.addAll(lastGroupOfSet)
        case .singleExercise, .circuit:
            guard let lastSet = updatedSession.circuits[circuitIndex].sets.last else { return }
            updatedSession.circuits[circuitIndex].sets.append(lastSet)
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
        }
        session.accept(updatedSession)
        updateSessionToDatabase()
    }
    func saveNewSession() {
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
        
        dataProvider.removeWorkoutSession(for: userID, at: sessionID)
    }
    func saveSession() {
        
    }
    func fetchHistory(for circuit: WorkoutCircuit) -> [WorkoutCircuitWithDate] {
        
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
