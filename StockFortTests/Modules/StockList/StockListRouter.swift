//
//  StockListRouter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import XCTest
@testable import StockFort

final class StockListRouterTests: XCTestCase {

    func testRouterStartSetsUpModuleCorrectly() {
        let router = StockListRouter.start()
        XCTAssertNotNil(router.entryPoint, "Router entryPoint should be set.")
        XCTAssertNotNil(router.entryPoint?.presenter)

        let presenter = router.entryPoint?.presenter
        XCTAssertNotNil(presenter?.view)
        XCTAssertNotNil(presenter?.interactor)
        XCTAssertNotNil(presenter?.router)
    }
}
