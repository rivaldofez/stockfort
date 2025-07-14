//
//  StockListInteractor.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import XCTest
@testable import StockFort

final class StockListInteractorTests: XCTestCase {

    func testFetchStocksReturnsData() {
        let interactor = StockListInteractor()
        let stocks = interactor.fetchStocks()

        XCTAssertFalse(stocks.isEmpty, "fetchStocks() should return non-empty stock array if SampleData.json exists.")
    }

    func testFetchStocksHasValidData() {
        let interactor = StockListInteractor()
        let stocks = interactor.fetchStocks()

        let stock = stocks.first
        XCTAssertNotNil(stock?.symbol)
        XCTAssertGreaterThan(stock?.price ?? 0, 0)
    }
}
