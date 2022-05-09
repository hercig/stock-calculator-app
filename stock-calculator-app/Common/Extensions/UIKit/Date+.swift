//
//  Date+.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 08.05.2022..
//

import Foundation

extension Date {
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
