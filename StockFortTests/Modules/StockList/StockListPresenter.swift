//
//  StockListPresenter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import XCTest
@testable import StockFort

final class StockListPresenterTests: XCTestCase {

    class MockView: StockListViewController {
        var didReloadTable = false

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
    }

    class MockTableView: UITableView {
        var didReload = false

        override func reloadData() {
            didReload = true
        }
    }

    func testPresenterLoadsStocksAndUpdatesView() {
        let presenter = StockListPresenter()
        let interactor = StockListInteractor()
        let mockView = StockListViewController()
        let mockTableView = MockTableView()
        mockView.tableView = mockTableView

        presenter.view = mockView
        presenter.interactor = interactor

        presenter.notifyViewDidLoad()

        XCTAssertFalse(presenter.stockData.isEmpty, "Presenter should load stocks.")
        XCTAssertTrue(mockTableView.didReload, "Presenter should trigger tableView.reloadData()")
    }
}

