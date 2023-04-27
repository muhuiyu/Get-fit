//
//  WorkoutCircuit.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation
import RealmSwift

typealias WorkoutCircuitTypeString = String
typealias WorkoutCircuitID = UUID

// MARK: - WorkoutCircuitType
enum WorkoutCircuitType: String, Codable {
    case singleExercise
    case superSet
    case circuit
}

// MARK: - WorkoutCircuit
struct WorkoutCircuit: Codable {
    let id: WorkoutCircuitID
    let date: YearMonthDay
    let type: WorkoutCircuitType
    var sets: [WorkoutSet]
    
    init(id: WorkoutCircuitID = UUID(),
         date: YearMonthDay,
         type: WorkoutCircuitType,
         sets: [WorkoutSet] = []) {
        self.id = id
        self.date = date
        self.type = type
        self.sets = sets
    }
}

// MARK: - Persistable
extension WorkoutCircuit: Persistable {
    public init(managedObject: WorkoutCircuitObject) {
        id = managedObject.id
        if let date = managedObject.date {
            self.date = YearMonthDay(managedObject: date)
        } else {
            self.date = YearMonthDay.today
        }
        type = WorkoutCircuitType(rawValue: managedObject.type) ?? .singleExercise
        sets = managedObject.sets.map({ WorkoutSet(managedObject: $0) })
    }
    public func managedObject() -> WorkoutCircuitObject {
        let setObjects = List<WorkoutSetObject>()
        sets.map({ $0.managedObject() }).forEach({ setObjects.append($0) })
        return WorkoutCircuitObject(id: id, date: date.managedObject(), type: type.rawValue, sets: setObjects)
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
    
    var singleLineTitle: String {
        switch type {
        case .singleExercise: return title
        case .circuit: return AppText.Workout.circuit
        case .superSet: return AppText.Workout.superSet
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
