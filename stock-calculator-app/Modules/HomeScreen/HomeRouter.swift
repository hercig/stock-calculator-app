//
//  HomeRouter.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import Foundation

// MARK: - HomeRouting

protocol HomeRouting {
    func navigateToStockDetails(with chartModel: Model.Chart)
}

// MARK: - HomeRouter

class HomeRouter: HomeRouting {
    
    weak var viewController: HomeViewController?
    
    func navigateToStockDetails(with chartModel: Model.Chart) {
        let detailsRouter = DetailsRouter()
        let detailsContext = DetailsContext(chartModel: chartModel)
        let detailsViewModel = DetailsViewModel(router: detailsRouter, context: detailsContext)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        detailsRouter.viewController = detailsViewController
        
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

