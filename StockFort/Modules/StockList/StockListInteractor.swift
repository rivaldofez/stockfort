//
//  StockListInteractor.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import Foundation

/// `StockListInteractor` is responsible for fetching a list of stocks from a local JSON file bundled with the app.
///
/// This class demonstrates how to load static JSON data, parse it using `JSONSerialization`,
/// and map each dictionary entry into a `Stock` model.
///
/// Example usage:
/// ```swift
/// let interactor = StockListInteractor()
/// let stocks = interactor.fetchStocks()
/// ```
///
/// The JSON file must be named "SampleData.json" and include an array under the `"stocks"` key.
class StockListInteractor {

    func fetchStocks() -> [Stock] {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let stocksArray = json["stocks"] as? [[String: Any]] else { return []}
        
        var result = [Stock]()
        
        for stockDict in stocksArray {
            if let stock = Stock(dict: stockDict) {
                result.append(stock)
            }
        }
        
        return result
    }
}
