//
//  StockListInteractor.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import Foundation

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
