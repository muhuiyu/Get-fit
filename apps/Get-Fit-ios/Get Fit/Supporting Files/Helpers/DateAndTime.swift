//
//  DateAndTime.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import Foundation
import UIKit

struct DateAndTime: Codable, Comparable, Equatable {
    var id: UUID = UUID()
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
}
extension DateAndTime {
    init() {
        let today = Date()
        self.year = today.year
        self.month = today.month
        self.day = today.dayOfMonth
        self.hour = today.hour
        self.minute = today.minute
        self.second = today.second
    }
    init(date: Date) {
        self.year = date.year
        self.month = date.month
        self.day = date.dayOfMonth
        self.hour = date.hour
        self.minute = date.minute
        self.second = date.second
    }
    init(date: YearMonthDay) {
        self.year = date.year
        self.month = date.month
        self.day = date.day
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
}
// MARK: - Persistable
extension DateAndTime: Persistable {
    public init(managedObject: DateAndTimeObject) {
        id = managedObject.id
        year = managedObject.year
        month = managedObject.month
        day = managedObject.day
        hour = managedObject.hour
        minute = managedObject.minute
        second = managedObject.second
    }
    public func managedObject() -> DateAndTimeObject {
        return DateAndTimeObject(id: id, year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
}
extension DateAndTime {
    func toDate(timeZone: String = "SGT") -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone(abbreviation: timeZone)
        return Calendar.current.date(from: dateComponents)
    }
    var toYearMonthDay: YearMonthDay { YearMonthDay(year: self.year, month: self.month, day: self.day) }
    var dateString: String {
        guard let month = Date.MonthInNumber(rawValue: month) else { return "" }
        return month.name + " " + String(day)
    }
    static func difference(from start: DateAndTime, to end: DateAndTime) -> TimeInterval {
        guard
            let startTime = start.toDate(),
            let endTime = end.toDate() else {
            return 0
        }
        return endTime - startTime
    }
}
extension DateAndTime {
    func beforeHours(_ numberOfHours: Int) -> DateAndTime {
        if let newDate = self.toDate()?.date(beforeHours: numberOfHours) {
            return DateAndTime(date: newDate)
        }
        return self
    }
    func afterHours(_ numberOfHours: Int) -> DateAndTime {
        if let newDate = self.toDate()?.date(afterHours: numberOfHours) {
            return DateAndTime(date: newDate)
        }
        return self
    }
    func beforeMinutes(_ numberOfMinutes: Int) -> DateAndTime {
        if let newDate = self.toDate()?.date(beforeMinutes: numberOfMinutes) {
            return DateAndTime(date: newDate)
        }
        return self
    }
    func afterMinutes(_ numberOfMinutes: Int) -> DateAndTime {
        if let newDate = self.toDate()?.date(afterMinutes: numberOfMinutes) {
            return DateAndTime(date: newDate)
        }
        return self
    }
}
extension DateAndTime {
    static func < (lhs: DateAndTime, rhs: DateAndTime) -> Bool {
        if lhs.year != rhs.year { return lhs.year < rhs.year }
        if lhs.month != rhs.month { return lhs.month < rhs.month }
        if lhs.day != rhs.day { return lhs.day < rhs.day }
        if lhs.hour != rhs.hour { return lhs.hour < rhs.hour }
        if lhs.minute != rhs.minute { return lhs.minute < rhs.minute }
        
        return lhs.second < rhs.second
    }
    
}
