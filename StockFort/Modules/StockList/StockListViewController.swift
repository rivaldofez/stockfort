//
//  ViewController.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

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
        tableView.register(StockCell.self, forCellReuseIdentifier: "StockCell")
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


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! StockCell
        let stock = stockData[indexPath.row]
        
        cell.symbolLabel.text = stock.symbol
        cell.priceLabel.text = String(stock.price)
        cell.changeLabel.text = "\(stock.change) (\(stock.percentage))"
        cell.volumeLabel.text = "Vol: \(stock.volume)"

        if stock.change > 0 {
            cell.changeLabel.textColor = .green
        } else if stock.change < 0 {
            cell.changeLabel.textColor = .red
        } else {
            cell.changeLabel.textColor = .black
        }

        return cell
    }
}

class StockCell: UITableViewCell {
    let symbolLabel = UILabel()
    let priceLabel = UILabel()
    let changeLabel = UILabel()
    let volumeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        symbolLabel.font = .boldSystemFont(ofSize: 20)
        priceLabel.font = .systemFont(ofSize: 20)
        changeLabel.font = .systemFont(ofSize: 16)
        volumeLabel.font = .systemFont(ofSize: 14)
        volumeLabel.textColor = .gray
        priceLabel.textAlignment = .right
        changeLabel.textAlignment = .right
        
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(volumeLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 16
        let contentWidth = contentView.bounds.width - (padding * 2)
        
        symbolLabel.frame = CGRect(x: padding, y: 10, width: contentWidth * 0.4, height: 24)
        volumeLabel.frame = CGRect(x: padding, y: 40, width: contentWidth * 0.5, height: 20)
        
        priceLabel.frame = CGRect(x: contentWidth * 0.5, y: 10, width: contentWidth * 0.5, height: 24)
        changeLabel.frame = CGRect(x: contentWidth * 0.5, y: 40, width: contentWidth * 0.5, height: 20)
    }
}
