//
//  DateForematter+.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 08.05.2022..
//

import Foundation

extension DateFormatter {
    
    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        return formatter
    }()
}
