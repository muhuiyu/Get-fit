//
//  AppTime.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import Foundation
import UIKit

struct DateAndTime {
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
}
extension DateAndTime {
    var toDate: Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone(abbreviation: CacheManager.shared.preferredTimezone)
        return Calendar.current.date(from: dateComponents)
    }
}

struct DateTriple: Comparable {
    var year: Int
    var month: Int
    var day: Int
}
extension DateTriple {
    static func < (lhs: DateTriple, rhs: DateTriple) -> Bool {
        guard let ldate = lhs.toDate, let rdate = rhs.toDate else { return false }
        return ldate < rdate
    }
}
extension DateTriple {
    var toDate: Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: CacheManager.shared.preferredTimezone)
        return Calendar.current.date(from: dateComponents)
    }
}

struct MonthAndYear: Comparable {
    var year: Int
    var month: Int
}
extension MonthAndYear {
    init(date: Date) {
        self.year = date.year
        self.month = date.month
    }
}
extension MonthAndYear {
    var isCurrentMonth: Bool {
        return self.year == Date.today.year && self.month == Date.today.month
    }
}
extension MonthAndYear {
    func toDate(dayOfMonth: Int = 1) -> Date? {
        DateTriple(year: self.year, month: self.month, day: dayOfMonth).toDate
    }
    var toMonthAndYearString: String? {
        self.toDate()?.toMonthAndYearString
    }
    var nextMonth: MonthAndYear {
        if month == 12 {
            return MonthAndYear(year: self.year+1, month: 1)
        } else {
            return MonthAndYear(year: self.year, month: self.month+1)
        }
    }
    var previousMonth: MonthAndYear {
        if month == 1 {
            return MonthAndYear(year: self.year-1, month: 12)
        } else {
            return MonthAndYear(year: self.year, month: self.month-1)
        }
    }
}
extension MonthAndYear {
    static func < (lhs: MonthAndYear, rhs: MonthAndYear) -> Bool {
        if lhs.year != rhs.year { return lhs.year < rhs.year }
        return lhs.month < rhs.month
    }
}
