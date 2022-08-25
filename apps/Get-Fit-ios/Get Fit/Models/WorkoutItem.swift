//
//  WorkoutItem.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

typealias WorkoutItemID = String

struct WorkoutItem {
    let id: WorkoutItemID
    let name: String
    let bodyPart: [WorkoutBodyPart]
    let machine: WorkoutMachine?
    let isSideDifference: Bool = false
}

extension WorkoutItem {
    var isMachineRequired: Bool {
        return machine != nil
    }
    var getBodyPartString: String {
        return bodyPart.map { $0.rawValue }.joined(separator: ", ")
    }
}

// MARK: - Interface
extension WorkoutItem {
    static func getWorkoutItem(of id: WorkoutItemID) -> WorkoutItem? {
        return all[id]
    }
    static func getWorkoutItemName(of id: WorkoutItemID, isLocalized: Bool = false) -> String? {
        // TODO: - Add localized
        return all[id]?.name
    }
    static func getAllWorkoutItemNames(isLocalized: Bool = false) -> [String] {
        // TODO: - Add localized
        return all.map { $0.value.name }
    }
    static func getAllWorkoutItemIDs() -> [WorkoutItemID] {
        return Array(all.keys)
    }
    static func getAllWorkoutItemIDs(including bodyParts: [WorkoutBodyPart]) -> [WorkoutItemID] {
        return Array(all.filter {
            for bodyPart in bodyParts {
                if $0.value.bodyPart.contains(bodyPart) { return true }
            }
            return false
        }.keys)
    }
}

// MARK: - Items
extension WorkoutItem {
    static let all: [WorkoutItemID: WorkoutItem] = [
        // upper body
        assistedPullUp.id: assistedPullUp,
        assistedDip.id: assistedDip,
        tricepPushdown.id: tricepPushdown,
        // lower body
        cableReverseLunge.id: cableReverseLunge,
        legPress.id: legPress,
        seatedLegPress.id: seatedLegPress,
        cablePullThrough.id: cablePullThrough,
        cableSplitSquat.id: cableSplitSquat,
        cableGobletSquat.id: cableGobletSquat,
        cableRomanianDeadlift.id: cableRomanianDeadlift,
        romanianDeadlift.id: romanianDeadlift,
    ]
    
    // Upper body
    static let assistedPullUp = WorkoutItem(id: "assistedPullUp",
                                            name: "Assisted pull up",
                                            bodyPart: [.back, .biceps],
                                            machine: .pullUpMachine)
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
                                            bodyPart: [.quads],
                                            machine: .seatedLegPressMachine)
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

// MARK: - Attributes
enum WorkoutBodyPart: String {
    case shoulders
    case lateral
    case back
    case chest
    case biceps
    case triceps
    case glutes
    case quads
    case hamstrings
    case calves
    case abs
}
enum WorkoutMachine {
    case cableMachine
    case pullUpMachine
    case plateLegPressMachine
    case seatedLegPressMachine
}
