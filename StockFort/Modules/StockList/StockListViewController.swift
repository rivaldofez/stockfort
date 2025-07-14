//
//  ViewController.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockListViewController: UIViewController {
    var presenter: StockListPresenter?

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        setupTableView()
        presenter?.notifyViewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Stock Ticker"
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StockItemCell.self, forCellReuseIdentifier: StockItemCell.identifier)
        tableView.rowHeight = 80
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
    }
}

extension StockListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.stockData.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockItemCell.identifier, for: indexPath) as? StockItemCell,
              let stock = presenter?.stockData[indexPath.row] else { return UITableViewCell()}
        
        cell.configure(with: stock)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = StockHeaderCell()
        return header.contentView
    }
}
