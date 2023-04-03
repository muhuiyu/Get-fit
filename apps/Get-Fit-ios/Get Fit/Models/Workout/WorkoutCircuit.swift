//
//  WorkoutCircuit.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import RealmSwift

typealias WorkoutCircuitTypeString = String

// MARK: - WorkoutCircuitType
enum WorkoutCircuitType: String, Codable {
    case singleExercise
    case superSet
    case circuit
}

// MARK: - WorkoutCircuit
struct WorkoutCircuit: Codable {
    let type: WorkoutCircuitType
    var sets: [WorkoutSet]
}

// MARK: - Persistable
extension WorkoutCircuit: Persistable {
    public init(managedObject: WorkoutCircuitObject) {
        type = WorkoutCircuitType(rawValue: managedObject.type) ?? .singleExercise
        sets = managedObject.sets.map({ WorkoutSet(managedObject: $0) })
    }
    public func managedObject() -> WorkoutCircuitObject {
        let setObjects = List<WorkoutSetObject>()
        sets.map({ $0.managedObject() }).forEach({ setObjects.append($0) })
        return WorkoutCircuitObject(type: type.rawValue, sets: setObjects)
    }
}

extension WorkoutCircuit {
    var title: String {
        switch type {
        case .superSet:
            var title = ""
            for (i, item) in workoutItems.enumerated() {
                if i != 0 {
                    title += "\n"
                }
                title += (String(integerToAlphabet(i)) + ". " + item.name)
            }
            return title
//            return workoutItems.map({ $0.name }).joined(separator: ", ")
        case .circuit:
            return "Circuit"
        case .singleExercise:
            return WorkoutItem.getWorkoutItemName(of: sets.first?.itemID ?? "") ?? "Workout"
        }
    }
    
    var workoutItems: [WorkoutItem] {
        if type == .singleExercise {
            if let item = WorkoutItem.getWorkoutItem(of: sets.first?.itemID ?? "") {
                return [ item ]
            }
            return []
        }
        
        var itemIDs = [String]()
        for set in sets {
            if itemIDs.contains(set.itemID) { break }
            itemIDs.append(set.itemID)
        }
        return itemIDs.compactMap({ WorkoutItem.getWorkoutItem(of: $0) })
    }
    
    var lastGroupOfSetsOfSuperSet: [WorkoutSet] {
        guard type == .superSet, !sets.isEmpty else { return [] }
        
        let superSetWorkoutItems = workoutItems
        guard !superSetWorkoutItems.isEmpty, sets.count >= superSetWorkoutItems.count else { return [] }
        
        return sets.suffix(superSetWorkoutItems.count)
    }
    
    func setIndexString(forSetAt setIndex: Int) -> String {
        let set = sets[setIndex]
        
        switch type {
        case .singleExercise, .circuit:
            switch set.type {
            case .normal: return String(setIndex + 1)
            case .warmUp: return "W"
            case .dropSet: return "D"
            }
        case .superSet:
            let exercises = workoutItems
            guard !exercises.isEmpty else { return String(setIndex + 1) }
            return String((setIndex / exercises.count) + 1) + String(integerToAlphabet(setIndex % exercises.count))
        }
    }
    
    private func integerToAlphabet(_ integer: Int, isUppercase: Bool = true) -> Character {
        let startingValue = Int(((isUppercase ? "A" : "a") as UnicodeScalar).value)
        return Character(UnicodeScalar(integer + startingValue) ?? UnicodeScalar.init(0))
    }

}
