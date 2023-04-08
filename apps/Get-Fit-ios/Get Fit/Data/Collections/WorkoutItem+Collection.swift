//
//  WorkoutItem+Collection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/30/22.
//

extension WorkoutItem {
    static let all: [WorkoutItemID: WorkoutItem] = [
        // upper body
        arnoldsPress.id: arnoldsPress,
        assistedDip.id: assistedDip,
        assistedPullUp.id: assistedPullUp,
        bicepCurl.id: bicepCurl,
        bicepCurlWithMachine.id: bicepCurlWithMachine,
        dumbbellChestPress.id: dumbbellChestPress,
        dumbbellInclinePress.id: dumbbellInclinePress,
        dumbbellLateralRaises.id: dumbbellLateralRaises,
        dumbbellShoulderPress.id: dumbbellShoulderPress,
        flatDumbbellChestFly.id: flatDumbbellChestFly,
        frontRaises.id: frontRaises,
        hammerCurls.id: hammerCurls,
        hammerStrengthLatPulldown.id: hammerStrengthLatPulldown,
        hammerStrengthRow.id: hammerStrengthRow,
        latPullDown.id: latPullDown,
        machineChestFly.id: machineChestFly,
        machineChestPress.id: machineChestPress,
        machineShoulderPress.id: machineShoulderPress,
        machineShoulderPressAlternating.id: machineShoulderPressAlternating,
        pushUp.id: pushUp,
        renegadeRows.id: renegadeRows,
        reverseSeatedPecDeck.id: reverseSeatedPecDeck,
        skullCrusher.id: skullCrusher,
        smithMachineBenchPress.id: smithMachineBenchPress,
        seatedCableRow.id: seatedCableRow,
        threePartCurls.id: threePartCurls,
        machineTricepsDip.id: machineTricepsDip,
        tricepPushdown.id: tricepPushdown,

        // lower body
        alternatingHipExtensionsWithBosuBall.id: alternatingHipExtensionsWithBosuBall,
        barbellBackSquat.id: barbellBackSquat,
        barbellFrontSquat.id: barbellFrontSquat,
        boxJump.id: boxJump,
        burpees.id: burpees,
        cableGobletSquat.id: cableGobletSquat,
        cableKickback.id: cableKickback,
        cablePullThrough.id: cablePullThrough,
        cableReverseLunge.id: cableReverseLunge,
        cableRomanianDeadlift.id: cableRomanianDeadlift,
        cableSideRaise.id: cableSideRaise,
        cableSplitSquat.id: cableSplitSquat,
        cableSquat.id: cableSquat,
        cableSideKick.id: cableSideKick,
        deadlift.id: deadlift,
        dumbbellGobletSquat.id: dumbbellGobletSquat,
        farmersWalk.id: farmersWalk,
        hipAbduction.id: hipAbduction,
        hipExtension.id: hipExtension,
        kneelingHipThrust.id: kneelingHipThrust,
        legPress.id: legPress,
        machineSeatedCalfRaise.id: machineSeatedCalfRaise,
        romanianDeadlift.id: romanianDeadlift,
        seatedLegCurl.id: seatedLegCurl,
        seatedLegExtension.id: seatedLegExtension,
        seatedLegPress.id: seatedLegPress,
        standingCableChestFly.id: standingCableChestFly,
        standingCableChestPress.id: standingCableChestPress,
        standingCableRow.id: standingCableRow,
        travellingSideSquats.id: travellingSideSquats,
        
        // core
    ]
    
    // Upper body
    static let arnoldsPress = WorkoutItem(id: "arnoldsPress",
                                          name: "Arnolds press",
                                          type: WorkoutItemType.strengthWeightAndReps,
                                          bodyPart: [.shoulders],
                                          mechanics: .compound,
                                          force: .push,
                                          isSideDifference: false,
                                          videoURLString: "https://www.youtube.com/watch?v=3ml7BH7mNwQ")
    static let dumbbellInclinePress = WorkoutItem(id: "dumbbellInclinePress",
                                                  name: "Dumbbell incline press",
                                                  type: WorkoutItemType.strengthWeightAndReps,
                                                  bodyPart: [.chest],
                                                  mechanics: .compound,
                                                  force: .push,
                                                  videoURLString: "https://www.youtube.com/watch?v=8iPEnn-ltC8")
    static let machineChestFly = WorkoutItem(id: "machineChestFly",
                                             name: "Machine chest fly",
                                             type: WorkoutItemType.strengthWeightAndReps,
                                             bodyPart: [.chest, .back, .shoulders],
                                             mechanics: .isolated,
                                             force: .push,
                                             machine: .seatedPecDeckMachine,
                                             videoURLString: "https://youtu.be/z7q_HYsCQOA")
    static let machineChestPress = WorkoutItem(id: "machineChestPress",
                                               name: "Machine chest press",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                               bodyPart: [.chest, .shoulders],
                                               mechanics: .compound,
                                               force: .push,
                                               machine: .chestPressMachine,
                                               videoURLString: "https://www.youtube.com/watch?v=n8TOta_pfr4")
    static let dumbbellChestPress = WorkoutItem(id: "dumbbellChestPress",
                                                name: "Dumbbell chest press",
                                                type: WorkoutItemType.strengthWeightAndReps,
                                                bodyPart: [.chest, .shoulders],
                                                mechanics: .compound,
                                                force: .push,
                                                videoURLString: "https://youtu.be/MvlqSLXgugY")
    static let hammerStrengthChestPress = WorkoutItem(id: "hammerStrengthChestPress",
                                                      name: "Hammer Strength chest press",
                                                      type: WorkoutItemType.strengthWeightAndReps,
                                                      bodyPart: [.chest, .shoulders],
                                                      mechanics: .compound,
                                                      force: .push)
    static let dumbbellShoulderPress = WorkoutItem(id: "dumbbellShoulderPress",
                                                   name: "Dumbbell shoulder press",
                                                   type: WorkoutItemType.strengthWeightAndReps,
                                                   bodyPart: [.shoulders],
                                                   mechanics: .compound,
                                                   force: .push)
    static let machineShoulderPress = WorkoutItem(id: "machineShoulderPress",
                                                  name: "Machine shoulder press",
                                                  type: WorkoutItemType.strengthWeightAndReps,
                                                  bodyPart: [.shoulders],
                                                  mechanics: .compound,
                                                  force: .push,
                                                  machine: .shoulderPressMachine)
    static let machineShoulderPressAlternating = WorkoutItem(id: "machineShoulderPressAlternating",
                                                             name: "Machine shoulder press alternating",
                                                             type: WorkoutItemType.strengthWeightAndReps,
                                                             bodyPart: [.shoulders],
                                                             mechanics: .compound,
                                                             force: .push,
                                                             machine: .shoulderPressMachine)
    static let reverseSeatedPecDeck = WorkoutItem(id: "reverseSeatedPecDeck",
                                                  name: "Reverse seated pec deck",
                                                  type: WorkoutItemType.strengthWeightAndReps,
                                                  bodyPart: [.shoulders, .back],
                                                  mechanics: .isolated,
                                                  force: .pull,
                                                  machine: .seatedPecDeckMachine)
    static let flatDumbbellChestFly = WorkoutItem(id: "flatDumbbellChestFly",
                                                  name: "Flat dumbbell chest fly",
                                                  type: WorkoutItemType.strengthWeightAndReps,
                                                  bodyPart: [.chest, .biceps],
                                                  mechanics: .isolated,
                                                  force: .push,
                                                  videoURLString: "https://youtu.be/T4okLh2eppw")
    static let threePartCurls = WorkoutItem(id: "threePartCurls",
                                            name: "3-Part curls",
                                            type: WorkoutItemType.strengthWeightAndReps,
                                            bodyPart: [.biceps],
                                            mechanics: .isolated,
                                            force: .pull,
                                            videoURLString: "https://www.youtube.com/watch?v=zSVftMjHDiQ")
    static let hammerCurls = WorkoutItem(id: "hammerCurls",
                                         name: "Hammer curls",
                                         type: WorkoutItemType.strengthWeightAndReps,
                                         bodyPart: [.biceps],
                                         mechanics: .isolated,
                                         force: .pull,
                                         videoURLString: "https://youtu.be/0IAM2YtviQY")
    static let bicepCurlWithMachine = WorkoutItem(id: "bicepCurlWithMachine",
                                                  name: "Bicep curl with machine",
                                                  type: WorkoutItemType.strengthWeightAndReps,
                                                  bodyPart: [.biceps],
                                                  mechanics: .isolated,
                                                  force: .pull,
                                                  machine: .bicepCurlMachine)
    static let bicepCurl = WorkoutItem(id: "bicepCurl",
                                       name: "Bicep curl",
                                       type: WorkoutItemType.strengthWeightAndReps,
                                       bodyPart: [.biceps],
                                       mechanics: .isolated,
                                       force: .pull)
    static let machineTricepsDip = WorkoutItem(id: "machineTricepsDip",
                                               name: "Machine tricep dip",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                               bodyPart: [.triceps, .chest],
                                               mechanics: .compound,
                                               force: .push,
                                               machine: .tricepDipMachine)
    static let pushUp = WorkoutItem(id: "pushUp",
                                    name: "Push up",
                                    type: WorkoutItemType.bodyWeightTrainingWeightAndReps,
                                    bodyPart: [.chest, .triceps],
                                    mechanics: .compound,
                                    force: .push)
    static let assistedPullUp = WorkoutItem(id: "assistedPullUp",
                                            name: "Assisted pull up",
                                            type: WorkoutItemType.bodyWeightTrainingAssistedBodyWeightAndReps,
                                            bodyPart: [.back, .biceps],
                                            mechanics: .compound,
                                            force: .pull,
                                            machine: .pullUpMachine,
                                            videoURLString: "https://youtu.be/XeaRyJQ9y1k")
    static let latPullDown = WorkoutItem(id: "latPullDown",
                                         name: "Lat pull down",
                                         type: WorkoutItemType.strengthWeightAndReps,
                                         bodyPart: [.back, .biceps],
                                         mechanics: .compound,
                                         force: .pull,
                                         machine: .cableMachine,
                                         videoURLString: "https://youtu.be/qViTZfPdm2g")
    static let seatedCableRow = WorkoutItem(id: "seatedCableRow",
                                            name: "Seated cable row",
                                            type: WorkoutItemType.strengthWeightAndReps,
                                            bodyPart: [.back, .biceps],
                                            mechanics: .compound,
                                            force: .pull,
                                            machine: .cableMachine)
    static let hammerStrengthRow = WorkoutItem(id: "hammerStrengthRow",
                                               name: "Seated machine row",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                               bodyPart: [.back, .biceps],
                                               mechanics: .compound,
                                               force: .pull,
                                               machine: .hammerStrength,
                                               videoURLString: "https://www.youtube.com/watch?v=btfqzuXvTqU")
    static let hammerStrengthLatPulldown = WorkoutItem(id: "hammerStrengthLatPulldown",
                                                       name: "Hammer strength lat pulldown",
                                                       type: WorkoutItemType.strengthWeightAndReps,
                                                       bodyPart: [.back],
                                                       mechanics: .compound,
                                                       force: .pull,
                                                       machine: .hammerStrength,
                                                       videoURLString: "https://www.youtube.com/watch?v=TZhDpyPJ0HM")
    static let smithMachineBenchPress = WorkoutItem(id: "smithMachineBenchPress",
                                                    name: "Smith machine bench press",
                                                    type: WorkoutItemType.strengthWeightAndReps,
                                                    bodyPart: [.chest, .triceps],
                                                    mechanics: .compound,
                                                    force: .push,
                                                    videoURLString: "https://www.youtube.com/watch?v=z_r6hDOYtO0")
    static let assistedDip = WorkoutItem(id: "assistedDip",
                                         name: "Assisted dip",
                                         type: WorkoutItemType.bodyWeightTrainingAssistedBodyWeightAndReps,
                                         bodyPart: [.triceps, .chest],
                                         mechanics: .compound,
                                         force: .push,
                                         machine: .pullUpMachine)
    static let tricepPushdown = WorkoutItem(id: "tricepPushdown",
                                            name: "Tricep pushdown",
                                            type: WorkoutItemType.strengthWeightAndReps,
                                            bodyPart: [.triceps],
                                            mechanics: .isolated,
                                            force: .push,
                                            machine: .cableMachine,
                                            videoURLString: "https://youtu.be/fvIVljEvqYY")
    static let skullCrusher = WorkoutItem(id: "skullCrusher",
                                          name: "Skull crusher",
                                          type: WorkoutItemType.strengthWeightAndReps,
                                          bodyPart: [.triceps],
                                          mechanics: .isolated,
                                          force: .push,
                                          videoURLString: "https://youtu.be/g6fhrKuJeRI")
    static let dumbbellLateralRaises = WorkoutItem(id: "dumbbellLateralRaises",
                                                   name: "Dumbbell lateral raises",
                                                   type: WorkoutItemType.strengthWeightAndReps,
                                                   bodyPart: [.shoulders, .lateral],
                                                   mechanics: .isolated,
                                                   force: .pull,
                                                   videoURLString: "https://youtu.be/q5sNYB1Q6aM")
    static let renegadeRows = WorkoutItem(id: "renegadeRows",
                                          name: "Renegade rows",
                                          type: WorkoutItemType.strengthWeightAndReps,
                                          bodyPart: [.back, .shoulders, .triceps, .core],
                                          mechanics: .compound,
                                          force: .pull,
                                          videoURLString: "https://youtu.be/LccyTxiUrhg")
    // Lower body
    static let deadlift = WorkoutItem(id: "deadlift",
                                      name: "Deadlift",
                                      type: WorkoutItemType.strengthWeightAndReps,
                                      bodyPart: [.back, .hamstrings, .glutes, .quads],
                                      mechanics: .compound,
                                      force: .pull,
                                      machine: .barbell,
                                      videoURLString: "https://youtu.be/-4qRntuXBSc")
    
    static let cableReverseLunge = WorkoutItem(id: "cableReverseLunge",
                                               name: "Cable reverse lunge",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                               bodyPart: [.glutes, .hamstrings],
                                               mechanics: .compound,
                                               force: .push,
                                               machine: .cableMachine,
                                               videoURLString: "https://youtu.be/_FwaDllRHuc")
    static let legPress = WorkoutItem(id: "legPress",
                                      name: "Leg press",
                                      type: WorkoutItemType.strengthWeightAndReps,
                                      bodyPart: [.quads, .glutes],
                                      mechanics: .compound,
                                      force: .push,
                                      machine: .plateLegPressMachine,
                                      videoURLString: "https://youtu.be/xCQ-FY_bj9E")
    static let seatedLegPress = WorkoutItem(id: "seatedLegPress",
                                            name: "Seated leg press",
                                            type: WorkoutItemType.strengthWeightAndReps,
                                            bodyPart: [.quads, .glutes],
                                            mechanics: .compound,
                                            force: .push,
                                            machine: .seatedLegPressMachine)
    static let seatedLegExtension = WorkoutItem(id: "seatedLegExtension",
                                                name: "Seated leg extension",
                                                type: WorkoutItemType.strengthWeightAndReps,
                                                bodyPart: [.quads],
                                                mechanics: .isolated,
                                                force: .push,
                                                machine: .seatedLegExtensionMachine,
                                                videoURLString: "https://youtu.be/KO0-I-JAi8Q")
    static let seatedLegCurl = WorkoutItem(id: "seatedLegCurl",
                                           name: "Seated leg curl",
                                           type: WorkoutItemType.strengthWeightAndReps,
                                           bodyPart: [.hamstrings],
                                           mechanics: .isolated,
                                           force: .pull,
                                           machine: .seatedLegCurlMachine,
                                           videoURLString: "https://youtu.be/F488k67BTNo")
    static let hipAbduction = WorkoutItem(id: "hipAbduction",
                                          name: "Hip abduction",
                                          type: WorkoutItemType.strengthWeightAndReps,
                                          bodyPart: [.glutes],
                                          mechanics: .isolated,
                                          force: .push,
                                          machine: .abductionMachine,
                                          videoURLString: "https://youtu.be/sqXw3xVlDfk")
    static let hipExtension = WorkoutItem(id: "hipExtension",
                                          name: "Hip extension",
                                          type: WorkoutItemType.strengthWeightAndReps,
                                          bodyPart: [.hamstrings, .glutes, .back],
                                          mechanics: .compound,
                                          force: .pull,
                                          machine: .romanChair,
                                          videoURLString: "https://youtu.be/3xc9k8k6ZxY")
    static let cablePullThrough = WorkoutItem(id: "cablePullThrough",
                                              name: "Cable pull through",
                                              type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.glutes, .hamstrings],
                                              mechanics: .compound,
                                              force: .pull,
                                              machine: .cableMachine,
                                              videoURLString: "https://youtu.be/4oZ_0_bQcOg")
    static let cableSplitSquat = WorkoutItem(id: "cableSplitSquat",
                                             name: "Cable split squat",
                                             type: WorkoutItemType.strengthWeightAndReps,
                                             bodyPart: [.glutes, .quads],
                                             mechanics: .compound,
                                             force: .pull,
                                             machine: .cableMachine,
                                             videoURLString: "https://youtu.be/alkroQK8YYY")
    static let cableGobletSquat = WorkoutItem(id: "cableGobletSquat",
                                              name: "Cable goblet squat",
                                              type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.quads, .glutes],
                                              mechanics: .compound,
                                              force: .push,
                                              machine: .cableMachine,
                                              videoURLString: "https://youtu.be/XBm_Hai75aY")
    static let cableRomanianDeadlift = WorkoutItem(id: "cableRomanianDeadlift",
                                                   name: "Cable Romanian deadlift",
                                                   type: WorkoutItemType.strengthWeightAndReps,
                                                   bodyPart: [.back, .hamstrings, .glutes],
                                                   mechanics: .compound,
                                                   force: .pull,
                                                   machine: .cableMachine)
    static let cableSquat = WorkoutItem(id: "cableSquat",
                                        name: "Cable squat",
                                        type: WorkoutItemType.strengthWeightAndReps,
                                        bodyPart: [.quads],
                                        mechanics: .compound,
                                        force: .push,
                                        machine: .cableMachine,
                                        videoURLString: "https://youtu.be/nPrz-nyFKgU")
    static let cableSideKick = WorkoutItem(id: "cableSideKick",
                                           name: "Cable side kick",
                                           type: WorkoutItemType.strengthWeightAndReps,
                                           bodyPart: [.glutes],
                                           mechanics: .isolated,
                                           force: .push,
                                           machine: .cableMachine,
                                           videoURLString: "https://youtu.be/jYuN92LGzpA")
    static let cableKickback = WorkoutItem(id: "cableKickback",
                                           name: "Cable kickback",
                                           type: WorkoutItemType.strengthWeightAndReps,
                                           bodyPart: [.glutes],
                                           mechanics: .isolated,
                                           force: .push,
                                           machine: .cableMachine,
                                           videoURLString: "https://youtu.be/SqO-VUEak2M")
    static let barbellBackSquat = WorkoutItem(id: "barbellBackSquat",
                                              name: "Barbell Back Squat",
                                              type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.quads, .glutes, .core],
                                              mechanics: .compound,
                                              force: .push,
                                              machine: .barbell,
                                              videoURLString: "https://youtu.be/Dy28eq2PjcM")
    static let barbellFrontSquat = WorkoutItem(id: "barbellFrontSquat",
                                              name: "Barbell Front Squat",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.quads, .glutes, .core],
                                              mechanics: .compound,
                                              force: .push,
                                              machine: .barbell,
                                              videoURLString: "")
    static let standingCableChestPress = WorkoutItem(id: "standingCableChestPress",
                                                     name: "Standing cable chest press",
                                                     type: WorkoutItemType.strengthWeightAndReps,
                                                     bodyPart: [.chest, .triceps],
                                                     mechanics: .compound,
                                                     force: .push,
                                                     machine: .cableMachine,
                                                     videoURLString: "https://youtu.be/RQfcHIQ41IA")
    static let standingCableChestFly = WorkoutItem(id: "standingCableChestPress",
                                                   name: "Standing cable chest press",
                                                   type: WorkoutItemType.strengthWeightAndReps,
                                                   bodyPart: [.chest, .biceps],
                                                   mechanics: .isolated,
                                                   force: .push,
                                                   machine: .cableMachine,
                                                   videoURLString: "https://youtu.be/ABEXJrhak3s")
    static let standingCableRow = WorkoutItem(id: "standingCableRow",
                                              name: "Standing cable row",
                                              type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.back, .biceps],
                                              mechanics: .compound,
                                              force: .pull,
                                              machine: .cableMachine,
                                              videoURLString: "https://youtu.be/XqXemUOEOu4")
    static let cableSideRaise = WorkoutItem(id: "cableSideRaise",
                                            name: "Cable side raise",
                                            type: WorkoutItemType.strengthWeightAndReps,
                                            bodyPart: [.lateral],
                                            mechanics: .isolated,
                                            force: .pull,
                                            machine: .cableMachine,
                                            videoURLString: "https://youtu.be/FGU9j1P5L-w")
    static let kneelingHipThrust = WorkoutItem(id: "kneelingHipThrust",
                                               name: "Kneeling hip thrust",
                                               type: WorkoutItemType.strengthWeightAndReps,
                                               bodyPart: [.glutes],
                                               mechanics: .isolated,
                                               force: .push,
                                               machine: .cableMachine,
                                               videoURLString: "https://youtu.be/MLMiXR_KS-s")
    static let romanianDeadlift = WorkoutItem(id: "RomanianDeadlift",
                                              name: "Romanian deadlift",
                                              type: WorkoutItemType.strengthWeightAndReps,
                                              bodyPart: [.glutes, .hamstrings, .back, .quads],
                                              mechanics: .compound,
                                              force: .pull,
                                              machine: .barbell,
                                              videoURLString: "https://youtu.be/2SHsk9AzdjA")
    static let dumbbellGobletSquat = WorkoutItem(id: "dumbbellGobletSquat",
                                                 name: "Dumbbell goblet squat",
                                                 type: WorkoutItemType.strengthWeightAndReps,
                                                 bodyPart: [.quads],
                                                 mechanics: .compound,
                                                 force: .push)
    static let travellingSideSquats = WorkoutItem(id: "travellingSideSquats",
                                                  name: "Travelling side squats",
                                                  type: WorkoutItemType.bodyWeightTrainingWeightAndReps,
                                                  bodyPart: [.quads, .glutes],
                                                  mechanics: .compound,
                                                  force: .push)
    static let farmersWalk = WorkoutItem(id: "farmersWalk",
                                         name: "Farmer's walk",
                                         type: WorkoutItemType.strengthWeightAndReps,
                                         bodyPart: [.quads, .glutes],
                                         mechanics: .compound,
                                         force: .push)
    static let boxJump = WorkoutItem(id: "boxJump",
                                     name: "Box jump",
                                     type: WorkoutItemType.bodyWeightTrainingReps,
                                     bodyPart: [.quads, .glutes, .back, .core],
                                     mechanics: .compound,
                                     force: .push)
    static let alternatingHipExtensionsWithBosuBall = WorkoutItem(id: "alternatingHipExtensionsWithBosuBall",
                                                                  name: "Alternating hip extensions with Bosu ball",
                                                                  type: WorkoutItemType.bodyWeightTrainingWeightAndReps,
                                                                  bodyPart: [.glutes],
                                                                  mechanics: .isolated,
                                                                  force: .push)
    static let frontRaises = WorkoutItem(id: "frontRaises",
                                         name: "Front raises",
                                         type: WorkoutItemType.strengthWeightAndReps,
                                         bodyPart: [.shoulders, .chest],
                                         mechanics: .isolated,
                                         force: .pull)
    static let machineSeatedCalfRaise = WorkoutItem(id: "machineSeatedCalfRaise",
                                                    name: "Machine seated calf raise",
                                                    type: WorkoutItemType.strengthWeightAndReps,
                                                    bodyPart: [.calves],mechanics: .isolated, force: .push,
                                                    machine: .calfRaiseMachine,
                                                    videoURLString: "https://youtu.be/abDaq2ly34Q")
    
    static let burpees = WorkoutItem(id: "burpees",
                                     name: "Burpees",
                                     type: WorkoutItemType.bodyWeightTrainingTime,
                                     bodyPart: [.chest, .core, .quads],
                                     mechanics: .compound,
                                     force: .push)
}
