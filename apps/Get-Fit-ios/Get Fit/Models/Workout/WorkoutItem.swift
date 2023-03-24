//
//  WorkoutItem.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

typealias WorkoutItemID = String

struct WorkoutItem: Hashable, Codable {
    let id: WorkoutItemID
    let name: String
    let bodyPart: [WorkoutBodyPart]
    let machine: WorkoutMachine?
    let isSideDifference: Bool
    let videoURLString: String?
    
    init(id: WorkoutItemID,
         name: String,
         bodyPart: [WorkoutBodyPart],
         machine: WorkoutMachine? = nil,
         isSideDifference: Bool = false,
         videoURLString: String? = nil) {
        self.id = id
        self.name = name
        self.bodyPart = bodyPart
        self.machine = machine
        self.isSideDifference = isSideDifference
        self.videoURLString = videoURLString
    }
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
