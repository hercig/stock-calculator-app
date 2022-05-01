//
//  ChartService.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 30.04.2022..
//

import Foundation
import RxSwift
import RxCocoa

protocol ChartServicing {
    func getStockData(stockSymbol: String, startTimestamp: Int, endTimestamp: Int, interval: String?, event: String?) -> Observable<Model.ChartResponse>
}

class ChartService: ChartServicing {
    
    func getStockData(stockSymbol: String, startTimestamp: Int, endTimestamp: Int, interval: String?, event: String?) -> Observable<Model.ChartResponse> {
        let request = ChartRequest(
            stockSymbol: stockSymbol,
            startTimestamp: startTimestamp,
            endTimestamp: endTimestamp,
            interval: interval,
            event: event
        )
        
        return APIClient
            .shared
            .performRequest(request)
            .asObservable()
    }
}
