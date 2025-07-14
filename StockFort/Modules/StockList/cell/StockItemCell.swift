//
//  StockCell.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockItemCell: UITableViewCell {
    static let identifier = String(describing: StockItemCell.self)
    
    let stockLabel = UILabel()
    let volLabel = UILabel()
    let frqLabel = UILabel()
    let prevLabel = UILabel()
    let changeLabel = UILabel()
    let percentLabel = UILabel()
    let priceLabel = UILabel()
    lazy var stack = UIStackView(arrangedSubviews: [
        stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel
    ])

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.arrangedSubviews.forEach { view in
            let label = view as? UILabel
            label?.font = UIFont.boldSystemFont(ofSize: 14)
            label?.textAlignment = .right
            label?.adjustsFontSizeToFitWidth = true
            label?.minimumScaleFactor = 0.5
            label?.numberOfLines = 1
        }
        
        stockLabel.textAlignment = .left
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(with stock: Stock) {
        self.stockLabel.text = stock.symbol
        self.volLabel.text = stock.volume
        self.frqLabel.text = stock.frequency
        self.prevLabel.text = String(stock.previous)
        self.changeLabel.text = String(stock.change)
        self.percentLabel.text = stock.percentage
        self.priceLabel.text = String(stock.price)
        
        var color: UIColor = .systemGreen
        if stock.change > 0 {
            color = .systemGreen
        } else if stock.change < 0 {
            color = .systemRed
        } else {
            color = .label
        }
        
        self.priceLabel.textColor = color
        self.changeLabel.textColor = color
        self.percentLabel.textColor = color
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
