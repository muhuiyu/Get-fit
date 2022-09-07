//
//  WorkoutItem+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

extension WorkoutItem {
    static let all: [WorkoutItemID: WorkoutItem] = [
        // upper body
        dumbbellBenchPress.id: dumbbellBenchPress,
        machineChestPress.id: machineChestPress,
        machineShoulderPress.id: machineShoulderPress,
        assistedPullUp.id: assistedPullUp,
        latPullDown.id: latPullDown,
        seatedCableRow.id: seatedCableRow,
        assistedDip.id: assistedDip,
        dumbbellSideRaises.id: dumbbellSideRaises,
        tricepPushdown.id: tricepPushdown,
        // lower body
        cableReverseLunge.id: cableReverseLunge,
        legPress.id: legPress,
        seatedLegPress.id: seatedLegPress,
        seatedLegExtension.id: seatedLegExtension,
        seatedLegCurl.id: seatedLegCurl,
        hipAbduction.id: hipAbduction,
        hipExtension.id: hipExtension,
        cablePullThrough.id: cablePullThrough,
        cableSplitSquat.id: cableSplitSquat,
        cableGobletSquat.id: cableGobletSquat,
        cableRomanianDeadlift.id: cableRomanianDeadlift,
        romanianDeadlift.id: romanianDeadlift,
    ]
    
    // Upper body
    static let dumbbellBenchPress = WorkoutItem(id: "dumbbellBenchPress",
                                                name: "Bench press",
                                                bodyPart: [.chest],
                                                machine: nil)
    static let machineChestPress = WorkoutItem(id: "machineChestPress",
                                               name: "Machine chest press",
                                               bodyPart: [.chest],
                                               machine: .chestPressMachine)
    static let machineShoulderPress = WorkoutItem(id: "machineShoulderPress",
                                                  name: "Machine shoulder press",
                                                  bodyPart: [.chest],
                                                  machine: .shoulderPressMachine)
    static let assistedPullUp = WorkoutItem(id: "assistedPullUp",
                                            name: "Assisted pull up",
                                            bodyPart: [.back, .biceps],
                                            machine: .pullUpMachine)
    static let latPullDown = WorkoutItem(id: "latPullDown",
                                            name: "Lat pull down",
                                            bodyPart: [.back, .biceps],
                                         machine: .cableMachine)
    static let seatedCableRow = WorkoutItem(id: "seatedCableRow",
                                            name: "Seated Cable Row",
                                            bodyPart: [.back, .biceps],
                                            machine: .cableMachine)
    static let assistedDip = WorkoutItem(id: "assistedDip",
                                         name: "Assisted dip",
                                         bodyPart: [.triceps, .chest],
                                         machine: .pullUpMachine)
    static let tricepPushdown = WorkoutItem(id: "tricepPushdown",
                                            name: "Tricep Pushdown",
                                            bodyPart: [.triceps],
                                            machine: .cableMachine)
    static let dumbbellSideRaises = WorkoutItem(id: "dumbbellSideRaises",
                                                name: "Dumbbell side raises",
                                                bodyPart: [.shoulders, .lateral],
                                                machine: nil)
    // Lower body
    static let cableReverseLunge = WorkoutItem(id: "cableReverseLunge",
                                               name: "Cable reverse lunge",
                                               bodyPart: [.quads],
                                               machine: .cableMachine)
    static let legPress = WorkoutItem(id: "legPress",
                                      name: "Leg press",
                                      bodyPart: [.quads],
                                      machine: .plateLegPressMachine)
    static let seatedLegPress = WorkoutItem(id: "seatedLegPress",
                                            name: "Seated leg press",
                                            bodyPart: [.quads, .glutes],
                                            machine: .seatedLegPressMachine)
    static let seatedLegExtension = WorkoutItem(id: "seatedLegExtension",
                                            name: "Seated leg extension",
                                            bodyPart: [.quads],
                                            machine: .seatedLegExtensionMachine)
    static let seatedLegCurl = WorkoutItem(id: "seatedLegCurl",
                                            name: "Seated leg curl",
                                            bodyPart: [.hamstrings],
                                            machine: .seatedLegCurlMachine)
    static let hipAbduction = WorkoutItem(id: "hipAbduction",
                                          name: "Hip abduction",
                                          bodyPart: [.glutes],
                                          machine: .abductionMachine)
    static let hipExtension = WorkoutItem(id: "hipExtension",
                                          name: "Hip extension",
                                          bodyPart: [.hamstrings],
                                          machine: .romanChair)
    static let cablePullThrough = WorkoutItem(id: "cablePullThrough",
                                              name: "Cable pull through",
                                              bodyPart: [.glutes],
                                              machine: .cableMachine)
    static let cableSplitSquat = WorkoutItem(id: "cableSplitSquat",
                                              name: "Cable split squat",
                                             bodyPart: [.glutes, .quads],
                                              machine: .cableMachine)
    static let cableGobletSquat = WorkoutItem(id: "cableGobletSquat",
                                              name: "Cable goblet squat",
                                             bodyPart: [.quads],
                                              machine: .cableMachine)
    static let cableRomanianDeadlift = WorkoutItem(id: "cableRomanianDeadlift",
                                                   name: "Cable Romanian deadlift",
                                                   bodyPart: [.glutes],
                                                   machine: .cableMachine)
    static let romanianDeadlift = WorkoutItem(id: "RomanianDeadlift",
                                              name: "Romanian deadlift",
                                              bodyPart: [.glutes],
                                              machine: nil)
}
