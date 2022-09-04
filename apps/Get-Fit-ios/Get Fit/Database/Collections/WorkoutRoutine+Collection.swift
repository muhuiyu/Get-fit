//
//  WorkoutRoutine+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

extension WorkoutRoutine {
    static let testEntries: [WorkoutRoutine] = [
        WorkoutRoutine(id: "full-body-1",
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.cableReverseLunge.id,
                            sets: [
                                WorkoutSetLog(weight: 21, reps: 15)
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.cableSplitSquat.id,
                            sets: [
                                WorkoutSetLog(weight: 21, reps: 15),
                                WorkoutSetLog(weight: 21, reps: 15),
                                WorkoutSetLog(weight: 21, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.assistedPullUp.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.assistedDip.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.cableGobletSquat.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.cableRomanianDeadlift.id,
                            sets: [
                                WorkoutSetLog(weight: 21, reps: 15),
                                WorkoutSetLog(weight: 21, reps: 15),
                                WorkoutSetLog(weight: 21, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 7.5, reps: 15),
                                WorkoutSetLog(weight: 7.5, reps: 15),
                                WorkoutSetLog(weight: 7.5, reps: 15),
                            ]),
                        WorkoutItemLog(
                            itemID: WorkoutItem.cablePullThrough.id,
                            sets: [
                                WorkoutSetLog(weight: 17.5, reps: 15),
                                WorkoutSetLog(weight: 17.5, reps: 15),
                                WorkoutSetLog(weight: 17.5, reps: 15),
                            ]),
                       ])
    ]
}

