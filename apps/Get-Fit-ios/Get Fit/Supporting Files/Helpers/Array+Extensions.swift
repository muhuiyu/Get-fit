//
//  Array+Extensions.swift
//  Get Fit
//
//  Created by Mu Yu on 3/21/23.
//

import Foundation

extension Array {
    mutating func addAll(_ items: [Element]) {
        items.forEach({ append($0) })
    }
    mutating func removeLast(_ numberOfItems: Int) {
        removeSubrange(Range(count - numberOfItems...count-1))
    }
}
