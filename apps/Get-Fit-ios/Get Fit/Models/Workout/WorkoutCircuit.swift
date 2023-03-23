//
//  WorkoutCircuit.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

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

extension WorkoutCircuit {
    var title: String {
        switch type {
        case .superSet:
            return sets.reduce(into: Set<String>()) { $0.insert($1.itemID) }.compactMap { id in
                WorkoutItem.getWorkoutItemName(of: id)
            }
            .joined(separator: ", ")
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
            let exercises = superSetWorkoutItems
            guard !exercises.isEmpty else { return String(setIndex + 1) }
            return String(setIndex / exercises.count) + "." + String(integerToAlphabet(setIndex % exercises.count))
        }
    }
    
    private func integerToAlphabet(_ integer: Int, isUppercase: Bool = false) -> Character {
        let startingValue = Int(((isUppercase ? "A" : "a") as UnicodeScalar).value)
        return Character(UnicodeScalar(integer + startingValue) ?? UnicodeScalar.init(0))
    }

}
