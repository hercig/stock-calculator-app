//
//  Endpoint.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 29.04.2022..
//

import Foundation

enum Endpoint {
    
    case fullPath(String)
    case chart(symbol: String)

    var path: String {
        switch self {
        case .fullPath:
            return _path
        default:
            return NetworkConstants.baseURLString + _path
        }
    }

    private var _path: String {
        switch self {
        case .fullPath(let path):
            return path
        case .chart(let symbol):
            return "/chart/\(symbol)"
        }
    }
}
