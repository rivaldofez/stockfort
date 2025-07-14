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
        contentView.backgroundColor = .systemBackground

        stockLabel.text = "STOCK"
        volLabel.text = "VOL"
        frqLabel.text = "FRQ"
        prevLabel.text = "PREV"
        changeLabel.text = "+/-"
        percentLabel.text = "%"
        priceLabel.text = "PRICE"
        
        stack.arrangedSubviews.forEach { view in
            let label = view as? UILabel
            label?.font = UIFont.boldSystemFont(ofSize: 12)
            label?.textAlignment = .right
            label?.adjustsFontSizeToFitWidth = true
            label?.minimumScaleFactor = 0.5
            label?.numberOfLines = 1
            label?.textColor = .systemOrange
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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
