//
//  HomeViewModel.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import Foundation

protocol HomeViewModeling {
    func onFavoriteButtonTap(with viewModel: FavoriteStockButtonViewModel)
}

class HomeViewModel {
    
    private let router: HomeRouting
    
    init(router: HomeRouter) {
        self.router = router
    }
}

extension HomeViewModel: HomeViewModeling {
    
    func onFavoriteButtonTap(with viewModel: FavoriteStockButtonViewModel) {
        // TODO: Go to details screen
    }
}
