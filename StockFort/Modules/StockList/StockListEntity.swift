//
//  StockEntity.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import Foundation

struct Stock {
    let symbol: String
    let volume: String
    let frequency: String
    let change: Int
    let percentage: String
    let price: Int
}

extension Stock {
    init?(dict: [String: Any]) {
        if let symbol = dict["symbol"] as? String,
           let volume = dict["volume"] as? String,
           let frequency = dict["frequency"] as? String,
           let change = dict["change"] as? Int,
           let percentage = dict["percentage"] as? String,
           let price = dict["price"] as? Int {
            
            self.symbol = symbol
            self.volume = volume
            self.frequency = frequency
            self.change = change
            self.percentage = percentage
            self.price = price
        } else {
            return nil
        }
    }
}
