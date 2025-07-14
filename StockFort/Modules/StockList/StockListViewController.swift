//
//  ViewController.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockListViewController: UIViewController {
    var presenter: StockListPresenter?
    
    var stockData: [Stock] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Stock Ticker"
        
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StockItemCell.self, forCellReuseIdentifier: StockItemCell.identifier)
        tableView.rowHeight = 80
    }
    
    func loadData() {
        let url = Bundle.main.url(forResource: "SampleData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let stocksArray = json["stocks"] as! [[String: Any]]
        
        for stockDict in stocksArray {
            if let stock = Stock(dict: stockDict) {
                self.stockData.append(stock)
            }
        }
        
        tableView.reloadData()
    }
    
    
    
}

extension StockListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockItemCell.identifier, for: indexPath) as! StockItemCell
        let stock = stockData[indexPath.row]
        
        cell.stockLabel.text = stock.symbol
        cell.volLabel.text = stock.volume
        cell.frqLabel.text = stock.frequency
        cell.prevLabel.text = String(stock.previous)
        cell.changeLabel.text = String(stock.change)
        cell.percentLabel.text = stock.percentage
        cell.priceLabel.text = String(stock.price)
        
        if stock.change > 0 {
            cell.priceLabel.textColor = .green
            cell.changeLabel.textColor = .green
            cell.percentLabel.textColor = .green
        } else if stock.change < 0 {
            cell.priceLabel.textColor = .red
            cell.changeLabel.textColor = .red
            cell.percentLabel.textColor = .red
        } else {
            cell.priceLabel.textColor = .black
            cell.changeLabel.textColor = .black
            cell.percentLabel.textColor = .black
        }
        
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
