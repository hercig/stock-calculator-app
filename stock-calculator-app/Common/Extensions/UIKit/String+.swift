//
//  String+.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 29.04.2022..
//

import Foundation

extension String {
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var toURL: URL? {
        return URL(string: self)
    }
}
