//
//  WorkoutSession+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation
import UIKit

// MARK: - Test entries
extension WorkoutSession {
    static let testEntries: [WorkoutSession] = [
        WorkoutSession(id: "20220828-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 8, day: 28, hour: 13, minute: 10, second: 0),
                       endTime: DateAndTime(year: 2022, month: 8, day: 28, hour: 13, minute: 46, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x5"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 22.5, reps: 15),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegPress.id,
                            sets: [
                                WorkoutSetLog(weight: 65, reps: 15),
                                WorkoutSetLog(weight: 70, reps: 15),
                                WorkoutSetLog(weight: 70, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegCurl.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipExtension.id,
                            sets: [
                                WorkoutSetLog(weight: 10, reps: 15),
                                WorkoutSetLog(weight: 10, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 10, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220829-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 8, day: 29, hour: 16, minute: 2, second: 0),
                       endTime: DateAndTime(year: 2022, month: 8, day: 29, hour: 16, minute: 30, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x5"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegCurl.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipAbduction.id,
                            sets: [
                                WorkoutSetLog(weight: 32, reps: 15),
                                WorkoutSetLog(weight: 32, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 10, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220831-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 8, day: 31, hour: 13, minute: 56, second: 0),
                       endTime: DateAndTime(year: 2022, month: 8, day: 31, hour: 14, minute: 45, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x5"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.machineChestPress.id,
                            sets: [
                                WorkoutSetLog(weight: 7.5, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 15, reps: 15),
                                WorkoutSetLog(weight: 17.5, reps: 8),
                            ],
                            restTime: TimeInterval(90),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 22.5, reps: 20),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipAbduction.id,
                            sets: [
                                WorkoutSetLog(weight: 32, reps: 15),
                                WorkoutSetLog(weight: 32, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 10, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220903-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 3, hour: 11, minute: 43, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 3, hour: 12, minute: 07, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20),
                                WorkoutSetLog(weight: 22.5, reps: 20),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegCurl.id,
                            sets: [
                                WorkoutSetLog(weight: 22.5, reps: 15),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220904-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 4, hour: 14, minute: 06, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 4, hour: 14, minute: 47, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                                WorkoutSetLog(weight: 50, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                                WorkoutSetLog(weight: 30, reps: 12),
                                WorkoutSetLog(weight: 30, reps: 12),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.machineChestPress.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 15, reps: 15),
                                WorkoutSetLog(weight: 15, reps: 15),
                                WorkoutSetLog(weight: 17.5, reps: 8),
                            ],
                            restTime: TimeInterval(90),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegCurl.id,
                            sets: [
                                WorkoutSetLog(weight: 22.5, reps: 15),
                                WorkoutSetLog(weight: 22.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 7.5, reps: 15),
                                WorkoutSetLog(weight: 7.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220905-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 5, hour: 18, minute: 06, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 5, hour: 18, minute: 27, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 60, reps: 15),
                                WorkoutSetLog(weight: 60, reps: 15),
                                WorkoutSetLog(weight: 60, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 30, reps: 12),
                                WorkoutSetLog(weight: 30, reps: 12),
                                WorkoutSetLog(weight: 30, reps: 12),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220906-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 6, hour: 15, minute: 47, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 6, hour: 16, minute: 23, second: 0),
                       title: "Full body #2",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedLegPress.id,
                            sets: [
                                WorkoutSetLog(weight: 50, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 65, reps: 15),
                                WorkoutSetLog(weight: 72.5, reps: 15),
                                WorkoutSetLog(weight: 72.5, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedCableRow.id,
                            sets: [
                                WorkoutSetLog(weight: 19, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 26, reps: 15),
                                WorkoutSetLog(weight: 26, reps: 15),
                                WorkoutSetLog(weight: 28.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.machineChestPress.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 17.5, reps: 15),
                                WorkoutSetLog(weight: 17.5, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 10),
                            ],
                            restTime: TimeInterval(90),
                            note: "light x1, morderate x1, heavy x2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipAbduction.id,
                            sets: [
                                WorkoutSetLog(weight: 28, reps: 15),
                                WorkoutSetLog(weight: 28, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 7.5, reps: 15),
                                WorkoutSetLog(weight: 7.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220908-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 7, minute: 17, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 8, minute: 01, second: 0),
                       title: "Full body #2",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.romanianDeadlift.id,
                            sets: [
                                WorkoutSetLog(weight: 30, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 40, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellBenchPress.id,
                            sets: [
                                WorkoutSetLog(weight: 12, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 16, reps: 15),
                                WorkoutSetLog(weight: 16, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20),
                                WorkoutSetLog(weight: 30, reps: 15),
                                WorkoutSetLog(weight: 30, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipAbduction.id,
                            sets: [
                                WorkoutSetLog(weight: 48, reps: 15),
                                WorkoutSetLog(weight: 48, reps: 15),
                                WorkoutSetLog(weight: 48, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220911-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 7, minute: 02, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 7, minute: 47, second: 0),
                       title: "Full body #1",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.legPress.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 40, reps: 15),
                                WorkoutSetLog(weight: 40, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.latPullDown.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                                WorkoutSetLog(weight: 27.5, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.machineChestPress.id,
                            sets: [
                                WorkoutSetLog(weight: 12, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 20, reps: 15),
                                WorkoutSetLog(weight: 20, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15, seat@3, push@2"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipAbduction.id,
                            sets: [
                                WorkoutSetLog(weight: 48, reps: 15),
                                WorkoutSetLog(weight: 48, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.hipExtension.id,
                            sets: [
                                WorkoutSetLog(weight: 10, reps: 15),
                                WorkoutSetLog(weight: 10, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.tricepPushdown.id,
                            sets: [
                                WorkoutSetLog(weight: 12.5, reps: 15),
                                WorkoutSetLog(weight: 12.5, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),
        WorkoutSession(id: "20220913-1",
                       userID: "TGOsAShY0ihwBXuxzoayOgK06kD3",
                       startTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 11, minute: 15, second: 0),
                       endTime: DateAndTime(year: 2022, month: 9, day: 8, hour: 11, minute: 37, second: 0),
                       title: "Full body #2",
                       itemLogs: [
                        WorkoutItemLog(
                            itemID: WorkoutItem.romanianDeadlift.id,
                            sets: [
                                WorkoutSetLog(weight: 20, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 35, reps: 15),
                                WorkoutSetLog(weight: 35, reps: 15),
                            ],
                            restTime: TimeInterval(120),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.seatedCableRow.id,
                            sets: [
                                WorkoutSetLog(weight: 19, reps: 20, isWarmUpSet: true),
                                WorkoutSetLog(weight: 29, reps: 15),
                                WorkoutSetLog(weight: 29, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.pushUp.id,
                            sets: [
                                WorkoutSetLog(weight: 0, reps: 15),
                                WorkoutSetLog(weight: 0, reps: 15),
                            ],
                            restTime: TimeInterval(90),
                            note: "3 x 15"
                        ),
                        WorkoutItemLog(
                            itemID: WorkoutItem.dumbbellSideRaises.id,
                            sets: [
                                WorkoutSetLog(weight: 8, reps: 15),
                                WorkoutSetLog(weight: 8, reps: 15),
                            ],
                            restTime: TimeInterval(60),
                            note: "3 x 15"
                        ),
                       ]),

    ]
}

