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
    var itemLogs: [WorkoutItemLog]  { get set }
    var note: String { get set }
    
    var allItemNames: String { get }
}
//extension WorkoutSessionInterface {
//    var allItemNames: String {
//        return itemLogs.compactMap { WorkoutItem.getWorkoutItemName(of: $0.itemID) }.joined(separator: ", ")
//    }
//}
