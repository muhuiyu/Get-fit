//
//  YearMonthDay.swift
//  Get Fit
//
//  Created by Mu Yu on 8/31/22.
//

import Foundation
import UIKit

typealias DateFormatString = String

struct YearMonthDay: Comparable, Hashable, Codable {
    var id: UUID = UUID()
    var year: Int
    var month: Int
    var day: Int
}
extension YearMonthDay {
    static func < (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        guard let ldate = lhs.toDate, let rdate = rhs.toDate else { return false }
        return ldate < rdate
    }
    var firstDayOfNextMonth: YearMonthDay {
        return day(after: Date.getNumberOfDays(year: year, month: month))
    }
    var firstDayOfPreviousMonth: YearMonthDay {
        return YearMonthDay(year: year, month: month, day: 1).day(after: -1).firstDayOfMonth
    }
    func day(after numberOfDays: Int) -> YearMonthDay {
        return toDate?.day(after: numberOfDays).toYearMonthDay ?? YearMonthDay.today
    }
    var firstDayOfMonth: YearMonthDay {
        return YearMonthDay(year: year, month: month, day: 1)
    }
}
extension YearMonthDay {
    static var today: YearMonthDay {
        let today = Date()
        return YearMonthDay(year: today.year, month: today.month, day: today.dayOfMonth)
    }
    
    var toDate: Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = .current
        return Calendar.current.date(from: dateComponents)
    }
    
    func toString(in format: DateFormatString) -> String {
        guard let date = self.toDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        dateFormatter.calendar = .current
        dateFormatter.locale = .current
        return dateFormatter.string(from: date)
    }
}
// MARK: - Persistable
extension YearMonthDay: Persistable {
    public init(managedObject: YearMonthDayObject) {
        id = managedObject.id
        year = managedObject.year
        month = managedObject.month
        day = managedObject.day
    }
    public func managedObject() -> YearMonthDayObject {
        return YearMonthDayObject(id: id, year: year, month: month, day: day)
    }
}

