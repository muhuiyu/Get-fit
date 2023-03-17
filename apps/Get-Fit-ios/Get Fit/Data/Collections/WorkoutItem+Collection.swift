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
        dumbbellInclinePress.id: dumbbellInclinePress,
        machineChestPress.id: machineChestPress,
        machineShoulderPress.id: machineShoulderPress,
        seatedPecDeck.id: seatedPecDeck,
        reverseSeatedPecDeck.id: reverseSeatedPecDeck,
        flatDumbbellChestFly.id: flatDumbbellChestFly,
        pushUp.id: pushUp,
        assistedPullUp.id: assistedPullUp,
        latPullDown.id: latPullDown,
        seatedCableRow.id: seatedCableRow,
        assistedDip.id: assistedDip,
        tricepPushdown.id: tricepPushdown,
        dumbbellSkullCrusher.id: dumbbellSkullCrusher,
        dumbbellSideRaises.id: dumbbellSideRaises,
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
        cableSquat.id: cableSquat,
        cableSideKick.id: cableSideKick,
        cableKickback.id: cableKickback,
        standingCableChestPress.id: standingCableChestPress,
        standingCableRow.id: standingCableRow,
        cableSideRaise.id: cableSideRaise,
        kneelingHipThrust.id: kneelingHipThrust,
        romanianDeadlift.id: romanianDeadlift,
    ]
    
    // Upper body
    static let dumbbellBenchPress = WorkoutItem(id: "dumbbellBenchPress",
                                                name: "Dumbbell bench press",
                                                bodyPart: [.chest],
                                                machine: nil)
    static let dumbbellInclinePress = WorkoutItem(id: "dumbbellInclinePress",
                                                name: "Dumbbell incline press",
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
    static let seatedPecDeck = WorkoutItem(id: "seatedPecDeck",
                                          name: "Seated pec deck",
                                          bodyPart: [.chest],
                                          machine: .seatedPecDeckMachine)
    static let reverseSeatedPecDeck = WorkoutItem(id: "reverseSeatedPecDeck",
                                                  name: "Reverse seated pec deck",
                                                  bodyPart: [.shoulders, .back],
                                                  machine: .seatedPecDeckMachine)
    static let flatDumbbellChestFly = WorkoutItem(id: "flatDumbbellChestFly",
                                                  name: "Flat dumbbell chest fly",
                                                  bodyPart: [.chest, .biceps],
                                                  machine: nil)
    static let pushUp = WorkoutItem(id: "pushUp",
                                    name: "Push up",
                                    bodyPart: [.chest, .triceps],
                                    machine: nil)
    static let assistedPullUp = WorkoutItem(id: "assistedPullUp",
                                            name: "Assisted pull up",
                                            bodyPart: [.back, .biceps],
                                            machine: .pullUpMachine)
    static let latPullDown = WorkoutItem(id: "latPullDown",
                                            name: "Lat pull down",
                                            bodyPart: [.back, .biceps],
                                         machine: .cableMachine)
    static let seatedCableRow = WorkoutItem(id: "seatedCableRow",
                                            name: "Seated cable row",
                                            bodyPart: [.back, .biceps],
                                            machine: .cableMachine)
    static let assistedDip = WorkoutItem(id: "assistedDip",
                                         name: "Assisted dip",
                                         bodyPart: [.triceps, .chest],
                                         machine: .pullUpMachine)
    static let tricepPushdown = WorkoutItem(id: "tricepPushdown",
                                            name: "Tricep pushdown",
                                            bodyPart: [.triceps],
                                            machine: .cableMachine)
    static let dumbbellSkullCrusher = WorkoutItem(id: "dumbbellSkullCrusher",
                                            name: "Dumbbell skull crusher",
                                            bodyPart: [.triceps],
                                            machine: nil)
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
    static let cableSquat = WorkoutItem(id: "cableSquat",
                                        name: "Cable squat",
                                        bodyPart: [.quads],
                                        machine: .cableMachine)
    static let cableSideKick = WorkoutItem(id: "cableSideKick",
                                        name: "Cable side kick",
                                        bodyPart: [.glutes],
                                        machine: .cableMachine)
    static let cableKickback = WorkoutItem(id: "cableKickback",
                                        name: "Cable kickback",
                                        bodyPart: [.glutes],
                                        machine: .cableMachine)
    static let standingCableChestPress = WorkoutItem(id: "standingCableChestPress",
                                                     name: "Standing cable chest press",
                                                     bodyPart: [.chest, .triceps],
                                                     machine: .cableMachine)
    static let standingCableRow = WorkoutItem(id: "standingCableRow",
                                              name: "Standing cable row",
                                              bodyPart: [.back, .biceps],
                                              machine: .cableMachine)
    static let cableSideRaise = WorkoutItem(id: "cableSideRaise",
                                            name: "Cable side raise",
                                            bodyPart: [.lateral],
                                            machine: .cableMachine)
    static let kneelingHipThrust = WorkoutItem(id: "kneelingHipThrust",
                                               name: "Kneeling hip thrust",
                                               bodyPart: [.glutes],
                                               machine: .cableMachine)
    static let romanianDeadlift = WorkoutItem(id: "RomanianDeadlift",
                                              name: "Romanian deadlift",
                                              bodyPart: [.glutes],
                                              machine: nil)
}
