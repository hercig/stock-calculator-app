//
//  DetailsViewModel.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import Foundation

// MARK: - DetailsViewModeling

protocol DetailsViewModeling {
    func onBackButtonTap()
}

// MARK: - DetailsViewModel

class DetailsViewModel {
    
    private let router: DetailsRouting
    private let context: DetailsContext
    
    init(router: DetailsRouting, context: DetailsContext) {
        self.router = router
        self.context = context
    }
}

// MARK: - Public Methods

extension DetailsViewModel: DetailsViewModeling {
    func onBackButtonTap() {
        router.navigateBack()
    }
}
