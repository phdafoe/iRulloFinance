//
//  File.swift
//  
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/9/24.
//

import Foundation
import iRulloFinance


@main
struct iRulloFinanceExc {
    
    private static let api = iRulloFinance()
    static func main() async {
        do {
            // Fetch AAPL stocks last 1 day
            let apple1dChart = try await api
                .fetchChartData(tickerSymbol: "AAPL", range: .oneDay)

            print(apple1dChart ?? "Not Found")
            
            // Search Ticker using "TESLA" as Query
            let tickers = try await api
                .searchTickers(query: "TESLA")
            print(tickers)
            
            // Fetch Quote Detail for multiple symbols
            // AAPL, TSLA, GOOG, MSFT
            let quotes = try await api
                .fetchQuotes(symbols: "AAPL,TSLA,GOOG,MSFT")
            print(quotes)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
