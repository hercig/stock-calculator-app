//
//  ChartRequest.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 30.04.2022..
//

import Foundation
import Alamofire

struct ChartRequest: APIRequest {
    typealias ResponseType = Model.ChartResponse
    
    var path: String {
        return Endpoint.chart(symbol: symbol).path
    }
    
    let symbol: String
    var query: [String: String]? = [:]
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?

    init(stockSymbol: String, startTimestamp: Int, endTimestamp: Int, interval: String?, event: String?) {
        self.symbol = stockSymbol
        query?["period1"] = startTimestamp.toString()
        query?["period2"] = endTimestamp.toString()
        query?["interval"] = interval
        query?["events"] = event
    }
    
}
