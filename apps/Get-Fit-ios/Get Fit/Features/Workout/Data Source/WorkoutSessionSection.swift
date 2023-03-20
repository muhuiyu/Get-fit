//
//  WorkoutSessionSection.swift
//  Get Fit
//
//  Created by Mu Yu on 8/21/22.
//

import RxDataSources

struct WorkoutSessionSection: Codable {
    var header: String
    var items: [Item]
    
    init(header: String, items: [Item]) {
        self.header = header
        self.items = items
    }
}

extension WorkoutSessionSection {
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

extension WorkoutSessionSection: SectionModelType {
    typealias Item = WorkoutSession
    
    init(original: WorkoutSessionSection, items: [Item]) {
        self = original
        self.items = items
    }
}
typealias WorkoutSessionSections = [WorkoutSessionSection]
extension WorkoutSessionSections {
    func sortedByDate() -> [WorkoutSessionSection] {
        return self.sorted { a, b in
            guard let aDate = a.items.first?.startTime.toDate(), let bDate = b.items.first?.startTime.toDate() else { return false }
            return aDate > bDate
        }
    }
}
