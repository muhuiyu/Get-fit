//
//  WorkoutItem.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

typealias WorkoutItemID = String

// MARK: - WorkoutItem
struct WorkoutItem: Codable {
    let id: WorkoutItemID
    let name: String
    let type: WorkoutItemType
    let bodyPart: [WorkoutBodyPart]
    let mechanics: WorkoutItemMechanics
    let force: WorkoutItemForce
    let machine: WorkoutMachine?
    let isSideDifference: Bool
    let videoURLString: String?
    let alsoKnownAsList: [String]
    
    init(id: WorkoutItemID,
         name: String,
         type: WorkoutItemType,
         bodyPart: [WorkoutBodyPart],
         mechanics: WorkoutItemMechanics,
         force: WorkoutItemForce,
         machine: WorkoutMachine? = nil,
         isSideDifference: Bool = false,
         videoURLString: String? = nil,
         alsoKnownAsList: [String] = []) {
        self.id = id
        self.name = name
        self.type = type
        self.bodyPart = bodyPart
        self.mechanics = mechanics
        self.force = force
        self.machine = machine
        self.isSideDifference = isSideDifference
        self.videoURLString = videoURLString
        self.alsoKnownAsList = alsoKnownAsList
    }
}

extension WorkoutItem: Equatable {
    var isCompoundMovement: Bool {
        return mechanics == .compound
    }
    var isMachineRequired: Bool {
        return machine != nil
    }
    var getBodyPartString: String {
        return bodyPart.map { $0.rawValue }.joined(separator: ", ")
    }
    static func == (lhs: WorkoutItem, rhs: WorkoutItem) -> Bool {
        return lhs.id == rhs.id
    }
    func shouldReturnAsSearchResult(for keyword: String) -> Bool {
        guard !keyword.isEmpty else { return false }
        if name.lowercased().contains(keyword.lowercased()) { return true }
        for word in alsoKnownAsList {
            if word.lowercased().contains(keyword.lowercased()) { return true }
        }
        // TODO: - Add body part
//        for part in bodyPart {
//            if part.rawValue.lowercased().contains(part) { return true }
//        }
        return false
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

// MARK: - WorkoutItemMechanics
enum WorkoutItemMechanics: String, Codable {
    case compound
    case isolated
}

// MARK: - WorkoutItemForce
enum WorkoutItemForce: String, Codable {
    case pull
    case push
}

// MARK: - WorkoutItemType
struct WorkoutItemType: Codable {
    let main: WorkoutItemMainType
    let secondary: WorkoutItemSecondaryType
    
    static var strengthWeightAndReps: WorkoutItemType {
        return WorkoutItemType(main: .strength, secondary: .weightAndReps)
    }
    static var strengthWeightAndTime: WorkoutItemType {
        return WorkoutItemType(main: .strength, secondary: .weightAndTime)
    }
    static var bodyWeightTrainingWeightAndReps: WorkoutItemType {
        return WorkoutItemType(main: .bodyweightStrengthTraining, secondary: .weightAndReps)
    }
    static var bodyWeightTrainingAssistedBodyWeightAndReps: WorkoutItemType {
        return WorkoutItemType(main: .bodyweightStrengthTraining, secondary: .AssistedBodyWeightAndReps)
    }
    static var bodyWeightTrainingReps: WorkoutItemType {
        return WorkoutItemType(main: .bodyweightStrengthTraining, secondary: .reps)
    }
    static var bodyWeightTrainingTime: WorkoutItemType {
        return WorkoutItemType(main: .bodyweightStrengthTraining, secondary: .time)
    }
    
    static var weightTypes: [WorkoutItemType] {
        return [ strengthWeightAndReps, strengthWeightAndTime ]
    }
    static var bodyweightTypes: [WorkoutItemType] {
        return [
            bodyWeightTrainingWeightAndReps,
            bodyWeightTrainingAssistedBodyWeightAndReps,
            bodyWeightTrainingReps,
            bodyWeightTrainingTime,
        ] }
    static var cardioTimeAndDistanceAndCalories: WorkoutItemType {
        return WorkoutItemType(main: .cardio, secondary: .timeAndDistanceAndCalories)
    }
    static var cardioTypes: [WorkoutItemType] {
        return [ WorkoutItemType.cardioTimeAndDistanceAndCalories ]
    }
    static var otherTypes: [WorkoutItemType] {
        return [ WorkoutItemType(main: .other, secondary: .notes)]
    }
}

// MARK: - WorkoutItemMainType
enum WorkoutItemMainType: String, Codable {
    case strength
    case bodyweightStrengthTraining
    case cardio
    case other
}

// MARK: - WorkoutItemSecondaryType
enum WorkoutItemSecondaryType: String, Codable {
    case weightAndReps
    case weightAndTime
    case AssistedBodyWeightAndReps
    case reps
    case time
    case timeAndDistanceAndCalories
    case notes
}
