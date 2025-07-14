//
//  StockListPresenter.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockListPresenter {
    weak var view: StockListViewController?
    var interactor: StockListInteractor?
    var presenter: StockListPresenter?
    var router: StockListRouter?
}
