//
//  WorkoutRoutine+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation

extension WorkoutRoutine {
    static let testEntries: [WorkoutRoutine] = [
        WorkoutRoutine(id: UUID(),
                       userID: UUID(),
                       title: "full body",
                       circuits: [
                        WorkoutRoutineCircuit(
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10, restTime: TimeInterval(60)),
                                WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10, restTime: TimeInterval(60)),
                                WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10, restTime: TimeInterval(60)),
                                WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10, restTime: TimeInterval(60)),
                            ]),
                        WorkoutRoutineCircuit(
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, restTime: TimeInterval(60), note: "9kg ball"),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, restTime: TimeInterval(60), note: "9kg ball"),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, restTime: TimeInterval(60), note: "9kg ball"),
                            ]),
                       ], note: "every Thursday")
    ]
}

