//
//  MockData.swift
//  Get Fit
//
//  Created by Mu Yu on 4/4/23.
//

import Foundation


// MARK: - Workout data

let workoutSessionData: [WorkoutSession] = [
        // MARK: - Jul 19 (session 27)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 7, day: 19, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 7, day: 19, hour: 12, minute: 0, second: 0),
           title: "Full body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 19),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 35, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 19),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaisesWithAdductions.id, type: .normal, weight: 5, reps: 8, note: "2.5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaisesWithAdductions.id, type: .normal, weight: 5, reps: 8, note: "2.5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaisesWithAdductions.id, type: .normal, weight: 5, reps: 8, note: "2.5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaisesWithAdductions.id, type: .normal, weight: 5, reps: 8, note: "2.5 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 19),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 19, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 19, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 19, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 19, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 19),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 6.25, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 6.25, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 6.25, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 6.25, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 19),
                type: .superSet,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hipExtension.id, type: .normal, weight: 5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.hipExtension.id, type: .normal, weight: 5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.hipExtension.id, type: .normal, weight: 5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.hipExtension.id, type: .normal, weight: 5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                ]),
            ]),
        // MARK: - Jul 18 (session 26)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 7, day: 18, hour: 17, minute: 30, second: 0),
           endTime: DateAndTime(year: 2023, month: 7, day: 18, hour: 18, minute: 30, second: 0),
           title: "Full body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 18),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.lunges.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.lunges.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.lunges.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.lunges.id, type: .normal, weight: 10, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 18),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellAlternatingShoulderPress.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellAlternatingShoulderPress.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellAlternatingShoulderPress.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellAlternatingShoulderPress.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 18),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 18),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 18),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 25, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 25, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 25, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 25, reps: 12),
                ]),
            ]),
        // MARK: - Jul 6 (session 25)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 7, day: 5, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 7, day: 5, hour: 12, minute: 0, second: 0),
           title: "Full body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 5),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 5),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                    WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 5),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 5),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 5),
                type: .superSet,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.overheadCableTricepExtension.id, type: .normal, weight: 7.6, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.pallofHolds.id, type: .normal, weight: 10, reps: 0, note: "30 sec each side"),
                    WorkoutSet(itemID: WorkoutItem.overheadCableTricepExtension.id, type: .normal, weight: 7.6, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.pallofHolds.id, type: .normal, weight: 10, reps: 0, note: "30 sec each side"),
                    WorkoutSet(itemID: WorkoutItem.overheadCableTricepExtension.id, type: .normal, weight: 7.6, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.pallofHolds.id, type: .normal, weight: 10, reps: 0, note: "30 sec each side"),
                    WorkoutSet(itemID: WorkoutItem.overheadCableTricepExtension.id, type: .normal, weight: 7.6, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.pallofHolds.id, type: .normal, weight: 10, reps: 0, note: "30 sec each side"),
                ]),
            ]),
        // MARK: - Jul 3 (session 24)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 7, day: 3, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 7, day: 3, hour: 12, minute: 0, second: 0),
           title: "Full body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 3),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 3),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 14, reps: 10, note: "7 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 14, reps: 10, note: "7 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 14, reps: 10, note: "7 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 14, reps: 10, note: "7 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 3),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 42.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 42.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 3),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "ez bar"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "ez bar"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "dumbbell"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "dumbbell"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 7, day: 3),
                type: .superSet,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 8, note: "20 x 2"),
                    WorkoutSet(itemID: WorkoutItem.cableHammerCurls.id, type: .normal, weight: 7.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 8, note: "20 x 2"),
                    WorkoutSet(itemID: WorkoutItem.cableHammerCurls.id, type: .normal, weight: 7.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 8, note: "20 x 2"),
                    WorkoutSet(itemID: WorkoutItem.cableHammerCurls.id, type: .normal, weight: 7.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 8, note: "20 x 2"),
                    WorkoutSet(itemID: WorkoutItem.cableHammerCurls.id, type: .normal, weight: 7.5, reps: 10),
                ]),
            ]),
        // MARK: - Jun 15 (session 23)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 6, day: 15, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 6, day: 15, hour: 12, minute: 0, second: 0),
           title: "Upper body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 15),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "6 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "6 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "6 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "6 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 15),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .warmUp, weight: 12.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 15),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedHammerCurls.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.seatedHammerCurls.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.seatedHammerCurls.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.seatedHammerCurls.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 15),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 15),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                ]),
            ]),
        // MARK: - Jun 12 (session 22)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 6, day: 12, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 6, day: 12, hour: 12, minute: 0, second: 0),
           title: "Leg",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 12),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .warmUp, weight: 10, reps: 10, note: "5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 20, reps: 5, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 20, reps: 5, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 30, reps: 5, note: "15 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 12),
                type: .circuit,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.smithMachineBackSquats.id, type: .normal, weight: 20, reps: 12, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 10, reps: 10),
                ],
                customizedTitle: "Squats"),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 12),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 20, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 20, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 20, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 12),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 20, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 20, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.hipExtensionWithBosuBall.id, type: .normal, weight: 20, reps: 10),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 6, day: 12),
                type: .superSet,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.cossackLunges.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                    WorkoutSet(itemID: WorkoutItem.wallSit.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                    WorkoutSet(itemID: WorkoutItem.cossackLunges.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                    WorkoutSet(itemID: WorkoutItem.wallSit.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                    WorkoutSet(itemID: WorkoutItem.cossackLunges.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                    WorkoutSet(itemID: WorkoutItem.wallSit.id, type: .normal, weight: 0, reps: 0, note: "45 sec"),
                ]),
            ]),
        // MARK: - May 11 (session 21)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 5, day: 11, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 5, day: 11, hour: 12, minute: 0, second: 0),
           title: "Full body",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 11),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 11),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 10, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 10, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 10, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 10, reps: 12),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 11),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 12, reps: 12, note: "Dual cables"),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 12, reps: 12, note: "Dual cables"),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 12, reps: 12, note: "Dual cables"),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 12, reps: 12, note: "Dual cables"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 11),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 6, reps: 15, note: "3 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 6, reps: 15, note: "3 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 6, reps: 15, note: "3 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 6, reps: 15, note: "3 x 2"),
                ]),
            ]),
        // MARK: - May 8 (session 20)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 5, day: 8, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 5, day: 8, hour: 12, minute: 0, second: 0),
           title: "Pull",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 8),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 30, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 30, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 30, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 8),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.facePullWithRotation.id, type: .normal, weight: 4.58, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.facePullWithRotation.id, type: .normal, weight: 4.58, reps: 12),
                    WorkoutSet(itemID: WorkoutItem.facePullWithRotation.id, type: .normal, weight: 4.58, reps: 12),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 8),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                    WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                    WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 8),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 9.5, reps: 12, note: "Dual cables"),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 16.5, reps: 8, note: "Dual cables"),
                    WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 13, reps: 10, note: "Dual cables"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 8),
                type: .superSet,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellLateralRaises.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                ]),
            ]),
        // MARK: - May 4 (session 19)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
           startTime: DateAndTime(year: 2023, month: 5, day: 4, hour: 11, minute: 0, second: 0),
           endTime: DateAndTime(year: 2023, month: 5, day: 4, hour: 12, minute: 0, second: 0),
           title: "Push",
           circuits: [
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing, 5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing, 5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing, 5 x 2"),
                    WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing, 5 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                    WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                    WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.flatDumbbellChestFly.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.flatDumbbellChestFly.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                    WorkoutSet(itemID: WorkoutItem.flatDumbbellChestFly.id, type: .normal, weight: 8, reps: 8, note: "4 x 2"),
                ]),
            WorkoutCircuit(
                date: YearMonthDay(year: 2023, month: 5, day: 4),
                type: .singleExercise,
                sets: [
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 15, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 15, reps: 10),
                    WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 15, reps: 10),
                ]),
            ]),
        // MARK: - Apr 24 (session 18)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
               startTime: DateAndTime(year: 2023, month: 4, day: 24, hour: 12, minute: 0, second: 0),
               endTime: DateAndTime(year: 2023, month: 4, day: 24, hour: 13, minute: 0, second: 0),
               title: "Leg",
               circuits: [
                WorkoutCircuit(
                    date: YearMonthDay(year: 2023, month: 4, day: 24),
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 12, reps: 15),
                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 12, reps: 15),
                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 12, reps: 15),
                    ]),
                WorkoutCircuit(
                    date: YearMonthDay(year: 2023, month: 4, day: 24),
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: WorkoutItem.kettleBellGoodMornings.id, type: .normal, weight: 16, reps: 10),
                        WorkoutSet(itemID: WorkoutItem.kettleBellGoodMornings.id, type: .normal, weight: 16, reps: 10),
                        WorkoutSet(itemID: WorkoutItem.kettleBellGoodMornings.id, type: .normal, weight: 16, reps: 10),
                    ]),
                WorkoutCircuit(
                    date: YearMonthDay(year: 2023, month: 4, day: 24),
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: WorkoutItem.smithMachineSplitSquats.id, type: .normal, weight: 5, reps: 6, note: "2.5 x 2, single leg"),
                        WorkoutSet(itemID: WorkoutItem.smithMachineSplitSquats.id, type: .normal, weight: 5, reps: 6, note: "2.5 x 2, single leg"),
                        WorkoutSet(itemID: WorkoutItem.smithMachineSplitSquats.id, type: .normal, weight: 5, reps: 6, note: "2.5 x 2, single leg"),
                    ]),
                WorkoutCircuit(
                    date: YearMonthDay(year: 2023, month: 4, day: 24),
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10),
                        WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10),
                        WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10),
                        WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 15, reps: 10),
                    ]),
                WorkoutCircuit(
                    date: YearMonthDay(year: 2023, month: 4, day: 24),
                    type: .singleExercise,
                    sets: [
                        WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, note: "9kg ball"),
                        WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, note: "9kg ball"),
                        WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 9, reps: 10, note: "9kg ball"),
                    ]),
                ]),
        // MARK: - Apr 20 (session 17)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                   startTime: DateAndTime(year: 2023, month: 4, day: 20, hour: 12, minute: 0, second: 0),
                   endTime: DateAndTime(year: 2023, month: 4, day: 20, hour: 13, minute: 0, second: 0),
                   title: "Full body",
                   circuits: [
                    WorkoutCircuit(
                        date: YearMonthDay(year: 2023, month: 4, day: 20),
                        type: .singleExercise,
                        sets: [
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 50, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 50, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 52.5, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 52.5, reps: 8),
                        ]),
                    WorkoutCircuit(
                        date: YearMonthDay(year: 2023, month: 4, day: 20),
                        type: .singleExercise,
                        sets: [
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 8),
                        ]),
                    WorkoutCircuit(
                        date: YearMonthDay(year: 2023, month: 4, day: 20),
                        type: .singleExercise,
                        sets: [
                            WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 27.5, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 35, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 35, reps: 10),
                        ]),
                    WorkoutCircuit(
                        date: YearMonthDay(year: 2023, month: 4, day: 20),
                        type: .singleExercise,
                        sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 10),
                        ]),
                    WorkoutCircuit(
                        date: YearMonthDay(year: 2023, month: 4, day: 20),
                        type: .singleExercise,
                        sets: [
                            WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10),
                        ]),
                    ]),
        // MARK: - Apr 17 (session 16)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 4, day: 17, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 4, day: 17, hour: 12, minute: 0, second: 0),
                       title: "Pull",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 27.5, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 27.5, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 27.5, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.machinePullDown.id, type: .normal, weight: 27.5, reps: 8),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 20, reps: 8, note: "10 x 2"),
                                WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 20, reps: 8, note: "10 x 2"),
                                WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 20, reps: 8, note: "10 x 2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.forearmCurl.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                                WorkoutSet(itemID: WorkoutItem.forearmCurl.id, type: .normal, weight: 10, reps: 10, note: "5 x 2"),
                                WorkoutSet(itemID: WorkoutItem.forearmCurl.id, type: .normal, weight: 10, reps: 10, note: "5 x 2"),
                                WorkoutSet(itemID: WorkoutItem.forearmCurl.id, type: .normal, weight: 10, reps: 10, note: "5 x 2"),
                            ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 4, day: 13),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 10, note: "close grip"),
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 10, note: "close grip"),
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 10, note: "close grip"),
                            ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 4, day: 13),
                                       type: .superSet, sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 10, note: "wide grip"),
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 10, reps: 10, note: "ez bar"),
                                        WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 10, note: "wide grip"),
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 10, reps: 10, note: "ez bar"),
                                        WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 26, reps: 10, note: "wide grip"),
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 10, reps: 10, note: "ez bar"),
                            ]),
                        ]),
        // MARK: - Apr 13 (session 15)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 4, day: 13, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 4, day: 13, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .warmUp, weight: 10, reps: 8, note: "5 x 2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, note: "6.25 x 2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, note: "6.25 x 2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "standing, 6 x 2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "standing, 6 x 2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, note: "standing, 6 x 2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.smithMachineInclinePress.id, type: .normal, weight: 10, reps: 8, note: "5 x 2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineInclinePress.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineInclinePress.id, type: .normal, weight: 7.5, reps: 8, note: "3.75 x 2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10, note: "narrow"),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10, note: "narrow"),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10, note: "narrow"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 13),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 8),
                            ]),
                       ]),
        // MARK: - Apr 6 (session 14)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 4, day: 6, hour: 11, minute: 30, second: 0),
                       endTime: DateAndTime(year: 2023, month: 4, day: 6, hour: 12, minute: 30, second: 0),
                       title: "Endurance",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .warmUp, weight: 20, reps: 10),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, note: "1 lap"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 24, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                                WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 24, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30)),
                            ]),
                       ],
                       note: ""),
        // MARK: - Mar 30 (session 13)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 30, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 30, hour: 12, minute: 0, second: 0),
                       title: "Full body",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30)),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, note: "20kg x2"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, note: "20kg x2"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, note: "20kg x2"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 45, reps: 8, note: "22.5kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, restTime: TimeInterval(30), note: "6kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 10, restTime: TimeInterval(30), note: "7kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 12, restTime: TimeInterval(30), note: "8kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg x2"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                            ]),
                       ],
                       note: ""),
        // MARK: - Mar 27 (session 12)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 27, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 27, hour: 12, minute: 0, second: 0),
                       title: "Pull",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12),
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12),
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, note: "10kg x2"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, note: "10kg x2"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, note: "10kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15kg x2"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15kg x2"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, note: "15kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 8, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30)),
                            ]),
                       ],
                       note: ""),
        // MARK: - Mar 23 (session 11)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 5, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 8, restTime: TimeInterval(30), note: "standing"),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 10, reps: 10, note: "5kg x2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, note: "6.25kg x2"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, note: "6.25kg x2"),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 12.5, reps: 4, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30)),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                            ]),
                        WorkoutCircuit(
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30)),
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30)),
                            ]),
                       ],
                       note: ""),
        // MARK: - Mar 20 (session 10)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 12, minute: 0, second: 0),
                       title: "Leg day",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .warmUp, weight: 30, reps: 8, note: "5kg x2"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 40, reps: 10, note: "10kg x2"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 50, reps: 10, note: "15kg x2"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 60, reps: 10, note: "20kg x2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30)),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30)),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30)),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .superSet,
                                       sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0)),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0)),
                                       ]),
                       ],
                       note: ""),
        // MARK: - Mar 16 (session 9)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 12, minute: 0, second: 0),
                       title: "Full body",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .superSet, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 12, restTime: TimeInterval(0)),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30)),
                        ]),
                       ],
                       note: ""),
        // MARK: - Mar 13 (session 8)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 13, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 13, hour: 12, minute: 0, second: 0),
                       title: "Pull",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 27.5, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 20, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 7, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 7, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.renegadeRows.id, type: .normal, weight: 7, reps: 12),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 6, reps: 10, restTime: TimeInterval(30), note: "Bare bar for forearm"),
                            WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 6, reps: 10, restTime: TimeInterval(30), note: "Bare bar for forearm"),
                            WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 6, reps: 10, restTime: TimeInterval(30), note: "Bare bar for forearm"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 30, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 30, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 35, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 33, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 33, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.seatedCableRow.id, type: .normal, weight: 33, reps: 8),
                        ]),
                       WorkoutCircuit(id: UUID(),
                                      date: YearMonthDay(year: 2023, month: 3, day: 13),
                                      type: .singleExercise, sets: [
                           WorkoutSet(itemID: WorkoutItem.frontRaises.id, type: .normal, weight: 5, reps: 8, restTime: TimeInterval(30)),
                           WorkoutSet(itemID: WorkoutItem.frontRaises.id, type: .normal, weight: 5, reps: 8, restTime: TimeInterval(30)),
                           WorkoutSet(itemID: WorkoutItem.frontRaises.id, type: .normal, weight: 5, reps: 8, restTime: TimeInterval(30)),
                       ]),
                      ]),
        // MARK: - Mar 9 (session 7)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 9, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 9, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 9),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 9),
                                       type: .singleExercise, sets: [
                                        
                                        // TODO: - confirm if this is both side or one side
                            WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 30, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.hammerStrengthChestPress.id, type: .normal, weight: 35, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 9),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8, restTime: TimeInterval(30)),
                                        WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 8, restTime: TimeInterval(30)),
                            WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(30)),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 9),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 12, reps: 8, note: "6kg x2"),
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 16, reps: 10, note: "8kg x2"),
                            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 16, reps: 10, note: "8kg x2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 9),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 10, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 10, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.standingCableChestFly.id, type: .normal, weight: 10, reps: 10),
                        ]),
                      ]),
        // MARK: - Mar 2 (session 6)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 2, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 2, hour: 12, minute: 0, second: 0),
                       title: "Lower Body",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.barbellBackSquat.id, type: .normal, weight: 20, reps: 8, note: "can't do 15x2 yet"),
                            WorkoutSet(itemID: WorkoutItem.barbellBackSquat.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.barbellBackSquat.id, type: .normal, weight: 10, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 24, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                            WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 24, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 0, reps: 1, restTime: TimeInterval(30), note: "1 lap, normal"),
                            WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap, ball on chest"),
                            WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap, ball and push"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.legPress.id, type: .normal, weight: 40, reps: 12, note: "20 x2"),
                            WorkoutSet(itemID: WorkoutItem.legPress.id, type: .normal, weight: 60, reps: 12, note: "30 x2"),
                            WorkoutSet(itemID: WorkoutItem.legPress.id, type: .normal, weight: 80, reps: 10, note: "40 x2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineSeatedCalfRaise.id, type: .normal, weight: 10, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.burpees.id, type: .normal, weight: 0, reps: 10, note: "30 sec"),
                            WorkoutSet(itemID: WorkoutItem.burpees.id, type: .normal, weight: 0, reps: 10, note: "30 sec"),
                            WorkoutSet(itemID: WorkoutItem.burpees.id, type: .normal, weight: 0, reps: 10, note: "30 sec"),
                        ]),
                      ]),
        // MARK: - Feb 27 (session 5)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 2, day: 27, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 2, day: 27, hour: 12, minute: 0, second: 0),
                       title: "Total Body",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 57.5, reps: 10, note: "without pads"),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 42.5, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 8, note: "15 x 2"),
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 8, note: "15 x 2"),
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 8, note: "15 x 2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .superSet, sets: [
                                        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 22.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 22.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 8),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 20, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 22.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 25, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 25, reps: 8),
                        ]),
                      ]),
        // MARK: - Feb 23 (session 4)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 2, day: 23, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 2, day: 23, hour: 12, minute: 0, second: 0),
                       title: "Pull",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, note: "10 x 2"),
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 30, reps: 8, note: "15 x 2"),
                                        WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 25, reps: 10, note: "12.5 x 2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.dumbbellInclineBenchRow.id, type: .normal, weight: 10, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellInclineBenchRow.id, type: .normal, weight: 10, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellInclineBenchRow.id, type: .normal, weight: 10, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 0, reps: 10, note: "bare bar"),
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 0, reps: 10, note: "bare bar"),
                                        WorkoutSet(itemID: WorkoutItem.bicepCurl.id, type: .normal, weight: 2.5, reps: 10, note: "1.25 x 2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 16.5, reps: 10, note: "close grip"),
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 15.5, reps: 10, note: "close grip"),
                                        WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 15.5, reps: 10, note: "close grip"),
                        ]),
                      ]),
        // MARK: - Feb 20 (session 3)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 2, day: 20, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 2, day: 20, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.barbellBenchPress.id, type: .normal, weight: 20, reps: 5, note: "bare bar"),
                                        WorkoutSet(itemID: WorkoutItem.barbellBenchPress.id, type: .normal, weight: 20, reps: 5, note: "bare bar"),
                                        WorkoutSet(itemID: WorkoutItem.barbellBenchPress.id, type: .normal, weight: 25, reps: 6, note: "2.5 x 2"),
                                        WorkoutSet(itemID: WorkoutItem.barbellBenchPress.id, type: .normal, weight: 25, reps: 6, note: "2.5 x 2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing"),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing"),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 10, reps: 10, note: "standing"),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 8, reps: 12, note: "standing"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 12),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 12, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 8),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 7.5, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 2),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 27.5, reps: 10, restTime: TimeInterval(30)),
                                        WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 22.5, reps: 10, restTime: TimeInterval(30)),
                                        WorkoutSet(itemID: WorkoutItem.machineTricepDips.id, type: .normal, weight: 22.5, reps: 10, restTime: TimeInterval(30)),
                        ]),
                      ]),
        // MARK: - Feb 16 (session 2)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 2, day: 16, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 2, day: 16, hour: 12, minute: 0, second: 0),
                       title: "Lower Body Strength",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 16),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .warmUp, weight: 12.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 15, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 10),
                                        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 17.5, reps: 10),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 16),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 20, reps: 8, note: "barbell"),
                                        WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 20, reps: 8, note: "barbell"),
                                        WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 20, reps: 8, note: "barbell"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 16),
                                       type: .singleExercise, sets: [
                                        WorkoutSet(itemID: WorkoutItem.singleLegSeatedLegPress.id, type: .normal, weight: 27.5, reps: 8, note: "both side"),
                                        WorkoutSet(itemID: WorkoutItem.singleLegSeatedLegPress.id, type: .normal, weight: 27.5, reps: 8, note: "both side"),
                                        WorkoutSet(itemID: WorkoutItem.singleLegSeatedLegPress.id, type: .normal, weight: 27.5, reps: 8, note: "both side"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.hipAbduction.id, type: .normal, weight: 53, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.hipAbduction.id, type: .normal, weight: 53, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.hipAbduction.id, type: .normal, weight: 53, reps: 10),
                        ]),
                      ]),
        // MARK: - Feb 13 (session 1)
        WorkoutSession(userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 2, day: 13, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 2, day: 13, hour: 12, minute: 0, second: 0),
                       title: "Total Body",
                       circuits: [
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.smithMachineBackSquats.id, type: .warmUp, weight: 0, reps: 12, note: "bare bar"),
                            WorkoutSet(itemID: WorkoutItem.smithMachineBackSquats.id, type: .normal, weight: 10, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.smithMachineBackSquats.id, type: .normal, weight: 20, reps: 12),
                            WorkoutSet(itemID: WorkoutItem.smithMachineBackSquats.id, type: .normal, weight: 25, reps: 12),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 8, reps: 10, note: "4 x 2"),
                        ]),
                        WorkoutCircuit(id: UUID(),
                                       date: YearMonthDay(year: 2023, month: 2, day: 13),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 15, reps: 10),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 20, reps: 8),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 17.5, reps: 10),
                        ]),
                      ]),

    ]
