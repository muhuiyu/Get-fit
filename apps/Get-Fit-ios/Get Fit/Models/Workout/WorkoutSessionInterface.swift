//
//  WorkoutSessionInterface.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation

protocol WorkoutSessionInterface {
    var id: String { get set }
    var title: String { get set }
    var circuits: [WorkoutCircuit]  { get set }
    var note: String { get set }
}

extension WorkoutSessionInterface {
    var allItemNames: String {
        return circuits
            .compactMap({ circuit in
                circuit.sets.compactMap({ WorkoutItem.getWorkoutItemName(of: $0.itemID) })
                    .reduce(into: Set<String>(), { $0.insert($1) })
                    .joined(separator: ", ")
            })
            .joined(separator: ", ")
    }
    var numberOfSets: Int {
        return circuits.reduce(into: 0) { $0 += $1.sets.count }
    }
    var totalWeight: Double {
        return circuits.reduce(into: 0) { $0 += $1.sets.reduce(into: 0) { $0 += $1.weight } }
    }
}
