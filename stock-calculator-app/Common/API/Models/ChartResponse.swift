//
//  ChartResponse.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 30.04.2022..
//

import Foundation

extension Model {
    
    // MARK: - ChartResponse
    struct ChartResponse: Codable {
        let chart: Chart?
    }

    // MARK: - Chart
    struct Chart: Codable {
        let result: [Result]?
        let error: ErrorResponse?
    }

    // MARK: - Result
    struct Result: Codable {
        let meta: Meta?
        let timestamp: [Int]?
        let events: Events?
        let indicators: Indicators?
    }
    
    // MARK: - Events
    struct Events: Codable {
        let dividends: [String: Dividend]?
    }
    
    // MARK: - Dividend
    struct Dividend: Codable {
        let amount: Double?
        let date: Int?
    }

    // MARK: - Indicators
    struct Indicators: Codable {
        let quote: [Quote]?
    }

    // MARK: - Quote
    struct Quote: Codable {
        let close, low: [Double]?
        let volume: [Int]?
        let quoteOpen, high: [Double]?

        enum CodingKeys: String, CodingKey {
            case close, low, volume
            case quoteOpen = "open"
            case high
        }
    }
	
    // MARK: - Meta
    struct Meta: Codable {
        let currency, symbol, exchangeName, instrumentType: String?
        let firstTradeDate, regularMarketTime, gmtoffset: Int?
        let timezone, exchangeTimezoneName: String?
        let regularMarketPrice, chartPreviousClose, previousClose: Double?
        let scale, priceHint: Int?
        let currentTradingPeriod: CurrentTradingPeriod?
        let tradingPeriods: [[Post]]?
        let dataGranularity, range: String?
        let validRanges: [String]?
    }

    // MARK: - CurrentTradingPeriod
    struct CurrentTradingPeriod: Codable {
        let pre, regular, post: Post?
    }

    // MARK: - Post
    struct Post: Codable {
        let timezone: String?
        let end, start, gmtoffset: Int?
    }
}
