//
//  DateAndTimeObject.swift
//  Get Fit
//
//  Created by Mu Yu on 3/25/23.
//

import Foundation
import RealmSwift

final class DateAndTimeObject: Object {
    override class func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var year: Int = 0
    @objc dynamic var month: Int = 0
    @objc dynamic var day: Int = 0
    @objc dynamic var hour: Int = 0
    @objc dynamic var minute: Int = 0
    @objc dynamic var second: Int = 0
    
    convenience init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        self.init()
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }
}
