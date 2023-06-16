//
//  WorkoutRoutineSection.swift
//  Get Fit
//
//  Created by Mu Yu on 5/4/23.
//

import RxDataSources

struct WorkoutRoutineSection: Codable {
    var header: String
    var items: [Item]
    
    init(header: String, items: [Item]) {
        self.header = header
        self.items = items
    }
}

extension WorkoutRoutineSection {
    private enum CodingKeys: String, CodingKey {
        case header
        case items
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decode(String.self, forKey: .header)
        items = try container.decode([Item].self, forKey: .items)
    }
}

extension WorkoutRoutineSection: SectionModelType {
    typealias Item = WorkoutRoutine
    
    init(original: WorkoutRoutineSection, items: [Item]) {
        self = original
        self.items = items
    }
}
typealias WorkoutRoutineSections = [WorkoutRoutineSection]
extension WorkoutRoutineSections {
//    func sortedByDate() -> [WorkoutRoutineSection] {
//        return self.sorted { a, b in
//            guard let aDate = a.items.first?.startTime.toDate(), let bDate = b.items.first?.startTime.toDate() else { return false }
//            return aDate > bDate
//        }
//    }
    func sortedByName() -> [WorkoutRoutineSection] {
        return self.sorted { a, b in
            a.items.first?.title ?? "" < b.items.first?.title ?? ""
        }
    }
    
    func sortedByCreatedDate() {
        // TODO: -
    }
}
