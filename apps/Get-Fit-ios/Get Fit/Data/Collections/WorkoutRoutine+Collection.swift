//
//  WorkoutRoutine+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation

extension WorkoutRoutine {
    static let testEntries: [WorkoutRoutine] = [
//        WorkoutRoutine(id: "45-min-full-body-1",
//                       title: "45 min Full body #1",
//                       itemLogs: [
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.legPress.id,
//                            sets: [
//                                WorkoutSetLog(weight: 20, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 50, reps: 15),
//                                WorkoutSetLog(weight: 55, reps: 12),
//                                WorkoutSetLog(weight: 55, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.latPullDown.id,
//                            sets: [
//                                WorkoutSetLog(weight: 20, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 22.5, reps: 15),
//                                WorkoutSetLog(weight: 30, reps: 12),
//                                WorkoutSetLog(weight: 30, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.machineChestPress.id,
//                            sets: [
//                                WorkoutSetLog(weight: 10, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 15, reps: 15),
//                                WorkoutSetLog(weight: 17.5, reps: 12),
//                                WorkoutSetLog(weight: 17.5, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.seatedLegCurl.id,
//                            sets: [
//                                WorkoutSetLog(weight: 22.5, reps: 15),
//                                WorkoutSetLog(weight: 22.5, reps: 15),
//                                WorkoutSetLog(weight: 22.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.dumbbellSideRaises.id,
//                            sets: [
//                                WorkoutSetLog(weight: 8, reps: 15),
//                                WorkoutSetLog(weight: 8, reps: 15),
//                                WorkoutSetLog(weight: 8, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.tricepPushdown.id,
//                            sets: [
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                       ]),
//        WorkoutRoutine(id: "45-min-full-body-2",
//                       title: "45 min Full body #2",
//                       itemLogs: [
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.romanianDeadlift.id,
//                            sets: [
//                                WorkoutSetLog(weight: 15, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 25, reps: 15),
//                                WorkoutSetLog(weight: 35, reps: 12),
//                                WorkoutSetLog(weight: 35, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.seatedCableRow.id,
//                            sets: [
//                                WorkoutSetLog(weight: 20, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 22.5, reps: 15),
//                                WorkoutSetLog(weight: 30, reps: 12),
//                                WorkoutSetLog(weight: 30, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.dumbbellBenchPress.id,
//                            sets: [
//                                WorkoutSetLog(weight: 10, reps: 20, type: .warmUp),
//                                WorkoutSetLog(weight: 15, reps: 15),
//                                WorkoutSetLog(weight: 17.5, reps: 12),
//                                WorkoutSetLog(weight: 17.5, reps: 12),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.hipAbduction.id,
//                            sets: [
//                                WorkoutSetLog(weight: 34, reps: 15),
//                                WorkoutSetLog(weight: 34, reps: 15),
//                                WorkoutSetLog(weight: 34, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.machineShoulderPress.id,
//                            sets: [
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.tricepPushdown.id,
//                            sets: [
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                                WorkoutSetLog(weight: 10, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                       ]),
//        WorkoutRoutine(id: "cable-full-body",
//                       title: "Cable Full body",
//                       itemLogs: [
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.cableReverseLunge.id,
//                            sets: [
//                                WorkoutSetLog(weight: 21, reps: 15)
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.cableSplitSquat.id,
//                            sets: [
//                                WorkoutSetLog(weight: 21, reps: 15),
//                                WorkoutSetLog(weight: 21, reps: 15),
//                                WorkoutSetLog(weight: 21, reps: 15),
//                            ],
//                            restTime: TimeInterval(120)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.assistedPullUp.id,
//                            sets: [
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(90)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.assistedDip.id,
//                            sets: [
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(90)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.cableGobletSquat.id,
//                            sets: [
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                                WorkoutSetLog(weight: 12.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(90)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.cableRomanianDeadlift.id,
//                            sets: [
//                                WorkoutSetLog(weight: 21, reps: 15),
//                                WorkoutSetLog(weight: 21, reps: 15),
//                                WorkoutSetLog(weight: 21, reps: 15),
//                            ],
//                            restTime: TimeInterval(90)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.tricepPushdown.id,
//                            sets: [
//                                WorkoutSetLog(weight: 7.5, reps: 15),
//                                WorkoutSetLog(weight: 7.5, reps: 15),
//                                WorkoutSetLog(weight: 7.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                        WorkoutItemLog(
//                            itemID: WorkoutItem.cablePullThrough.id,
//                            sets: [
//                                WorkoutSetLog(weight: 17.5, reps: 15),
//                                WorkoutSetLog(weight: 17.5, reps: 15),
//                                WorkoutSetLog(weight: 17.5, reps: 15),
//                            ],
//                            restTime: TimeInterval(60)
//                        ),
//                       ]),
    ]
}

