//
//  UIFont+.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 28.04.2022..
//

import UIKit

extension UIFont {
    
    static func appFont(with size: CGFloat, weight: Weight = .regular) -> UIFont {
        return UIFont(name: "Montserrat-\(weight.weightString)", size: size)!
    }
}

private extension UIFont.Weight {
    
    var weightString: String {
        switch self {
        case .regular:
            return "Regular"
        case .medium:
            return "Medium"
        case .semibold:
            return "SemiBold"
        case .bold:
            return "Bold"
        case .black:
            return "Black"
        case .ultraLight:
            return "UltraLight"
        case .thin:
            return "Thin"
        case .light:
            return "Light"
        default:
            return "Unknown"
        }
    }
}
