//
//  UIControl+Rx.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 28.04.2022..
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIControl {
    
    var tap: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }
}
