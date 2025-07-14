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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stack = UIStackView(arrangedSubviews: [
            stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually

        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])

        stockLabel.textAlignment = .center
        volLabel.textAlignment = .center
        frqLabel.textAlignment = .center
        prevLabel.textAlignment = .center
        changeLabel.textAlignment = .center
        percentLabel.textAlignment = .center
        priceLabel.textAlignment = .center
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
