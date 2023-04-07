//
//  MockData.swift
//  Get Fit
//
//  Created by Mu Yu on 4/4/23.
//

import Foundation


// MARK: - Workout data

let workoutCircuitData: [WorkoutCircuit] = [
     WorkoutCircuit(
         id: UUID(uuidString: "f8e663b7-07d0-423e-b40a-2a3e6258fff6") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "c59858c1-182d-4d91-85a6-bfe4ef98097d") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "1f09496b-a812-4844-bbd4-aacb4515eb30") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
             WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
             WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "f3f00867-efdf-451b-b1e2-ff363886f096") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
             WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
             WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "1771644d-4d01-4763-a2ff-a5587d65e6bd") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
        type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
             WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
             WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "bee2bdaf-ec69-4fdb-bf62-cb0c38e24881") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 3, day: 27),
        type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 8, restTime: TimeInterval(30), note: ""),
             WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30), note: ""),
             WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30), note: ""),
         ]),
    WorkoutCircuit(
        id: UUID(uuidString: "5e8d719b-52bd-4f14-af32-b3aa3188ede1") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 30),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "5550b804-f71b-4f31-a859-8d27641dedc2") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 30),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
            WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
            WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
            WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 45, reps: 8, restTime: TimeInterval(60), note: "22.5kg each side"),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "70e3ac39-879c-440f-ac7e-afa3469da450") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 30),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, restTime: TimeInterval(30), note: "6kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 10, restTime: TimeInterval(30), note: "7kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg each side"),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "ffb95a28-1bde-4b56-8ed1-be42379a3d58") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 30),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 12, restTime: TimeInterval(30), note: "8kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
            WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "4f333f02-8e20-490f-976c-9fed5b710d31") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 30),
       type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
            WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
            WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
        ]),
    WorkoutCircuit(id: UUID(uuidString: "660e968e-488f-4d95-b3d6-73fb70c055ee") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 16),
                   type: .singleExercise, sets: [
        WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
        WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
        WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
        WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "70f1c24c-0d94-44bd-b5fc-350bd7b4776e") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 16),
                   type: .singleExercise, sets: [
        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
        WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "f5f41b8c-4dfd-4afb-bd56-5bec73bf8a07") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 16),
                   type: .superSet, sets: [
        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
        WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 12, restTime: TimeInterval(0), note: ""),
        WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "ac189352-11ac-4c92-b595-02acf3d270dd") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 16),
                   type: .singleExercise, sets: [
        WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
        WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
        WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "9a6a3f08-8e29-4fe7-84e2-f2901d05cb0d") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 20),
                   type: .singleExercise, sets: [
        WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .warmUp, weight: 30, reps: 8, restTime: TimeInterval(60), note: "5kg each side"),
        WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
        WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 50, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
        WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 60, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "5835dce1-98c5-4eb2-92ba-5c82dd588b19") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 20),
                   type: .singleExercise, sets: [
        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
        WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
    ]),
    WorkoutCircuit(id: UUID(uuidString: "df86d40f-fa10-42d6-916a-29ad2e5c3eaf") ?? UUID(),
                   date: YearMonthDay(year: 2023, month: 3, day: 20),
                   type: .superSet,
                   sets: [
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                    WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                   ]),
    WorkoutCircuit(
        id: UUID(uuidString: "1dd0cb6b-1eae-46c5-ad3a-e4b89a63c942") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 23),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 5, reps: 10, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 8, restTime: TimeInterval(30), note: "standing"),
            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
            WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "38fa8a35-2b25-45bc-8430-d511dd6d7a19") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 23),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 10, reps: 10, restTime: TimeInterval(60), note: "5kg each side"),
            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
            WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "ba7a1e2f-205b-49c6-ad2e-f9771a0fbc32") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 23),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 12.5, reps: 4, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "68f0fa8f-ce8b-432b-aac0-17fb8c0b1a1d") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 23),
        type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
        ]),
    WorkoutCircuit(
        id: UUID(uuidString: "0eda5310-370a-465b-9b04-351bd0822d45") ?? UUID(),
        date: YearMonthDay(year: 2023, month: 3, day: 23),
       type: .singleExercise,
        sets: [
            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
            WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
        ]),
     WorkoutCircuit(
         id: UUID(uuidString: "23a04970-3526-4d31-9919-a42252173506") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 4, day: 6),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .warmUp, weight: 20, reps: 10, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
             WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "529a7308-2d3c-42af-8817-81ca6cc84e48") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 4, day: 6),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
             WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
             WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
             WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(60), note: "1 lap"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "fd1f940f-c8ac-46b9-885a-9f128596a974") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 4, day: 6),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 12, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
             WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 12, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "6c7b8efd-eb42-47f8-912d-d69d4cfa9832") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 4, day: 6),
         type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
             WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
             WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
         ]),
     WorkoutCircuit(
         id: UUID(uuidString: "2d883ee2-a1af-442f-ada5-b27010a874a4") ?? UUID(),
         date: YearMonthDay(year: 2023, month: 4, day: 6),
        type: .singleExercise,
         sets: [
             WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
             WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
             WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
         ]),
]

let workoutSessionData: [WorkoutSession] = [
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 4, day: 6, hour: 11, minute: 30, second: 0),
                       endTime: DateAndTime(year: 2023, month: 4, day: 6, hour: 12, minute: 30, second: 0),
                       title: "Endurance",
                       circuits: [
                        WorkoutCircuit(
                            id: UUID(uuidString: "23a04970-3526-4d31-9919-a42252173506") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .warmUp, weight: 20, reps: 10, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "529a7308-2d3c-42af-8817-81ca6cc84e48") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(30), note: "1 lap"),
                                WorkoutSet(itemID: WorkoutItem.travellingSideSquats.id, type: .normal, weight: 5, reps: 1, restTime: TimeInterval(60), note: "1 lap"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "fd1f940f-c8ac-46b9-885a-9f128596a974") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 12, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                                WorkoutSet(itemID: WorkoutItem.farmersWalk.id, type: .normal, weight: 12, reps: 3, restTime: TimeInterval(30), note: "3 laps"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "6c7b8efd-eb42-47f8-912d-d69d4cfa9832") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                                WorkoutSet(itemID: WorkoutItem.boxJump.id, type: .normal, weight: 0, reps: 20, restTime: TimeInterval(30), note: "18' box"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "2d883ee2-a1af-442f-ada5-b27010a874a4") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 4, day: 6),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.alternatingHipExtensionsWithBosuBall.id, type: .normal, weight: 0, reps: 12, restTime: TimeInterval(30), note: ""),
                            ]),
                       ],
                       note: ""),
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 30, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 30, hour: 12, minute: 0, second: 0),
                       title: "Full body",
                       circuits: [
                        WorkoutCircuit(
                            id: UUID(uuidString: "5e8d719b-52bd-4f14-af32-b3aa3188ede1") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "5550b804-f71b-4f31-a859-8d27641dedc2") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
                                WorkoutSet(itemID: WorkoutItem.romanianDeadlift.id, type: .normal, weight: 45, reps: 8, restTime: TimeInterval(60), note: "22.5kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "70e3ac39-879c-440f-ac7e-afa3469da450") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 12, reps: 10, restTime: TimeInterval(30), note: "6kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 10, restTime: TimeInterval(30), note: "7kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellShoulderPress.id, type: .normal, weight: 14, reps: 12, restTime: TimeInterval(30), note: "7kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "ffb95a28-1bde-4b56-8ed1-be42379a3d58") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 16, reps: 12, restTime: TimeInterval(30), note: "8kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
                                WorkoutSet(itemID: WorkoutItem.dumbbellChestPress.id, type: .normal, weight: 20, reps: 8, restTime: TimeInterval(30), note: "10kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "4f333f02-8e20-490f-976c-9fed5b710d31") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 30),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                                WorkoutSet(itemID: WorkoutItem.skullCrusher.id, type: .normal, weight: 10, reps: 12, restTime: TimeInterval(30), note: "ez bar"),
                            ]),
                       ],
                       note: ""),
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 27, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 27, hour: 12, minute: 0, second: 0),
                       title: "Pull",
                       circuits: [
                        WorkoutCircuit(
                            id: UUID(uuidString: "f8e663b7-07d0-423e-b40a-2a3e6258fff6") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.latPullDown.id, type: .normal, weight: 33, reps: 8, restTime: TimeInterval(60), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "c59858c1-182d-4d91-85a6-bfe4ef98097d") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
                                WorkoutSet(itemID: WorkoutItem.reverseSeatedPecDeck.id, type: .normal, weight: 4, reps: 12, restTime: TimeInterval(60), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "1f09496b-a812-4844-bbd4-aacb4515eb30") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
                                WorkoutSet(itemID: WorkoutItem.threePartCurls.id, type: .normal, weight: 2.5, reps: 21, restTime: TimeInterval(30), note: "1.25kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "f3f00867-efdf-451b-b1e2-ff363886f096") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthLatPulldown.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "1771644d-4d01-4763-a2ff-a5587d65e6bd") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
                                WorkoutSet(itemID: WorkoutItem.hammerStrengthRow.id, type: .normal, weight: 30, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "bee2bdaf-ec69-4fdb-bf62-cb0c38e24881") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 27),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 8, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.hammerCurls.id, type: .normal, weight: 4, reps: 10, restTime: TimeInterval(30), note: ""),
                            ]),
                       ],
                       note: ""),
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 23, hour: 12, minute: 0, second: 0),
                       title: "Push",
                       circuits: [
                        WorkoutCircuit(
                            id: UUID(uuidString: "1dd0cb6b-1eae-46c5-ad3a-e4b89a63c942") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .warmUp, weight: 5, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 8, restTime: TimeInterval(30), note: "standing"),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                                WorkoutSet(itemID: WorkoutItem.arnoldsPress.id, type: .normal, weight: 7, reps: 10, restTime: TimeInterval(30), note: "seated"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "38fa8a35-2b25-45bc-8430-d511dd6d7a19") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 10, reps: 10, restTime: TimeInterval(60), note: "5kg each side"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
                                WorkoutSet(itemID: WorkoutItem.smithMachineBenchPress.id, type: .normal, weight: 12.5, reps: 8, restTime: TimeInterval(60), note: "6.25kg each side"),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "ba7a1e2f-205b-49c6-ad2e-f9771a0fbc32") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 12.5, reps: 4, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.machineShoulderPressAlternating.id, type: .normal, weight: 7.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "68f0fa8f-ce8b-432b-aac0-17fb8c0b1a1d") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                            type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.tricepPushdown.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            ]),
                        WorkoutCircuit(
                            id: UUID(uuidString: "0eda5310-370a-465b-9b04-351bd0822d45") ?? UUID(),
                            date: YearMonthDay(year: 2023, month: 3, day: 23),
                           type: .singleExercise,
                            sets: [
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 20, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
                                WorkoutSet(itemID: WorkoutItem.machineChestFly.id, type: .normal, weight: 17.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            ]),
                       ],
                       note: ""),
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 20, hour: 12, minute: 0, second: 0),
                       title: "Leg day",
                       circuits: [
                        WorkoutCircuit(id: UUID(uuidString: "9a6a3f08-8e29-4fe7-84e2-f2901d05cb0d") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .warmUp, weight: 30, reps: 8, restTime: TimeInterval(60), note: "5kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 40, reps: 10, restTime: TimeInterval(60), note: "10kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 50, reps: 10, restTime: TimeInterval(60), note: "15kg each side"),
                            WorkoutSet(itemID: WorkoutItem.deadlift.id, type: .normal, weight: 60, reps: 10, restTime: TimeInterval(60), note: "20kg each side"),
                        ]),
                        WorkoutCircuit(id: UUID(uuidString: "5835dce1-98c5-4eb2-92ba-5c82dd588b19") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.dumbbellGobletSquat.id, type: .normal, weight: 22.5, reps: 8, restTime: TimeInterval(30), note: ""),
                        ]),
                        WorkoutCircuit(id: UUID(uuidString: "df86d40f-fa10-42d6-916a-29ad2e5c3eaf") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 20),
                                       type: .superSet,
                                       sets: [
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegExtension.id, type: .normal, weight: 42.5, reps: 10, restTime: TimeInterval(0), note: ""),
                                        WorkoutSet(itemID: WorkoutItem.seatedLegCurl.id, type: .normal, weight: 35, reps: 10, restTime: TimeInterval(0), note: ""),
                                       ]),
                       ],
                       note: ""),
        WorkoutSession(id: UUID(),
                       userID: UUID(uuidString: "fcc57b74-1e96-4cae-82b0-ee237e261e9a") ?? UUID(),
                       startTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 11, minute: 0, second: 0),
                       endTime: DateAndTime(year: 2023, month: 3, day: 16, hour: 12, minute: 0, second: 0),
                       title: "Full body",
                       circuits: [
                        WorkoutCircuit(id: UUID(uuidString: "660e968e-488f-4d95-b3d6-73fb70c055ee") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.assistedPullUp.id, type: .normal, weight: 35, reps: 12, restTime: TimeInterval(60), note: ""),
                        ]),
                        WorkoutCircuit(id: UUID(uuidString: "70f1c24c-0d94-44bd-b5fc-350bd7b4776e") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                            WorkoutSet(itemID: WorkoutItem.seatedLegPress.id, type: .normal, weight: 65, reps: 10, restTime: TimeInterval(60), note: ""),
                        ]),
                        WorkoutCircuit(id: UUID(uuidString: "f5f41b8c-4dfd-4afb-bd56-5bec73bf8a07") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .superSet, sets: [
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 15, reps: 12, restTime: TimeInterval(0), note: "added 5kg RH only x8"),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                            WorkoutSet(itemID: WorkoutItem.machineShoulderPress.id, type: .normal, weight: 12.5, reps: 12, restTime: TimeInterval(0), note: ""),
                            WorkoutSet(itemID: WorkoutItem.machineChestPress.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(0), note: "added 5kg RH only x12"),
                        ]),
                        WorkoutCircuit(id: UUID(uuidString: "ac189352-11ac-4c92-b595-02acf3d270dd") ?? UUID(),
                                       date: YearMonthDay(year: 2023, month: 3, day: 16),
                                       type: .singleExercise, sets: [
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                            WorkoutSet(itemID: WorkoutItem.bicepCurlWithMachine.id, type: .normal, weight: 12.5, reps: 10, restTime: TimeInterval(30), note: ""),
                        ]),
                       ],
                       note: ""),
    ]
