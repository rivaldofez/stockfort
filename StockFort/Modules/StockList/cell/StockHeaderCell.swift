//
//  StockHeaderCell.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

class StockHeaderCell: UITableViewCell {
    static let identifier = String(describing: StockHeaderCell.self)
    
    let stockLabel = UILabel()
    let volLabel = UILabel()
    let frqLabel = UILabel()
    let prevLabel = UILabel()
    let changeLabel = UILabel()
    let percentLabel = UILabel()
    let priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stack = UIStackView(arrangedSubviews: [
            stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = .white

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])

        stockLabel.text = "STOCK"
        volLabel.text = "VOL"
        frqLabel.text = "FRQ"
        prevLabel.text = "PREV"
        changeLabel.text = "+/-"
        percentLabel.text = "%"
        priceLabel.text = "PRICE"

        [stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel].forEach {
            $0.font = UIFont.boldSystemFont(ofSize: 14)
            $0.textAlignment = .center
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
