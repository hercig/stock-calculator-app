//
//  HomeViewModel.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - HomeViewModeling

protocol HomeViewModeling {
    func onFavoriteButtonTap(with viewModel: FavoriteStockButtonViewModel)
}

// MARK: - HomeViewModel

class HomeViewModel {
    
    private let router: HomeRouting
    private let chartService: ChartServicing
    private let disposeBag = DisposeBag()
    
    init(router: HomeRouter, chartService: ChartServicing = ChartService()) {
        self.router = router
        self.chartService = chartService
    }
}

// MARK: - Public Methods

extension HomeViewModel: HomeViewModeling {
    
    func onFavoriteButtonTap(with viewModel: FavoriteStockButtonViewModel) {
        chartService
            .getStockData(stockSymbol: viewModel.stockSymbol, startTimestamp: 1630670000, endTimestamp: 1648764000, interval: "1mo", event: "div")
            .subscribe(onNext: { [weak self] response in
                if let chartModel = response.chart {
                    self?.navigateToStockDetails(with: chartModel)
                }
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}

private extension HomeViewModel {
    
    func navigateToStockDetails(with chartModel: Model.Chart) {
        router.navigateToStockDetails(with: chartModel)
    }
}
