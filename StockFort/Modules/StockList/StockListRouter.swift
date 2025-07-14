//
//  StockListRouter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

/// `StockListRouter` handles navigation and wiring for the stock list module.
///
/// This router is responsible for creating and connecting the View, Presenter, and Interactor
/// to set up the module according to the VIPER architecture.
///
/// Example usage:
/// ```swift
/// let router = StockListRouter.start()
/// let initialViewController = router.entryPoint
/// ```
///
/// - Note: The `entryPoint` holds a reference to the configured `StockListViewController`.
class StockListRouter {

    /// The initial view controller for the stock list module.
    /// This will be returned to the caller to present or embed as needed.
    var entryPoint: StockListViewController?
    
    /// Creates and configures the VIPER module for the stock list feature.
    static func start() -> StockListRouter {
        let view = StockListViewController()
        let interactor = StockListInteractor()
        let presenter = StockListPresenter()
        let router = StockListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        router.entryPoint = view
        
        return router
    }
}
