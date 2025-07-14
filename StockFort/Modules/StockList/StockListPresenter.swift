//
//  StockListPresenter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

/// `StockListPresenter` acts as the Presenter in the VIPER architecture for the stock list feature.
///
/// The Presenter handles communication between the View and the Interactor.
/// It requests data from the Interactor, holds it, and updates the View as needed.
///
/// Example usage:
/// ```swift
/// presenter.notifyViewDidLoad()
/// ```
///
/// - Note: This Presenter owns the stock data and tells the View when to reload.
class StockListPresenter {

    /// The View layer reference. Weak to avoid retain cycles.
    weak var view: StockListViewController?

    /// The Interactor responsible for fetching stocks.
    var interactor: StockListInteractor?

    /// The Router responsible for navigation.
    var router: StockListRouter?

    /// Holds the current list of stocks fetched from the Interactor.
    var stockData: [Stock] = []

    /// Notifies the Presenter that the View has loaded.
    ///
    /// This should be called by the View Controller in its `viewDidLoad()`.
    /// It triggers the Presenter to load stock data.
    func notifyViewDidLoad() {
        loadStocks()
    }

    /// Loads stock data using the Interactor and updates the View.
    ///
    /// The fetched stock data is stored in `stockData`, and the View's table view
    /// is reloaded to display the new data.
    private func loadStocks() {
        self.stockData = interactor?.fetchStocks() ?? []
        view?.tableView.reloadData()
    }
}
