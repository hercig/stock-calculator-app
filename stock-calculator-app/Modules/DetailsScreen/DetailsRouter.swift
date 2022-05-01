//
//  DetailsRouter.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import Foundation

// MARK: - DetailsRouting

protocol DetailsRouting {
    func navigateBack()
}

// MARK: - DetailsRouter

class DetailsRouter: DetailsRouting {
    
    weak var viewController: DetailsViewController?
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
