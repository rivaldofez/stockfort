//
//  StockListRouter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockListRouter {
    var entryPoint: StockListViewController?
    
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
