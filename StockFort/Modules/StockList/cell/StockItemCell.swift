//
//  StockCell.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

/// `StockItemCell` is a custom `UITableViewCell` for displaying a single stock's details.
///
/// This cell shows multiple pieces of stock information in a horizontal stack:
/// - Stock symbol
/// - Volume
/// - Frequency
/// - Previous price
/// - Price change
/// - Percentage change
/// - Current price
///
/// The labels are laid out using a `UIStackView` with equal spacing.
///
/// Example usage:
/// ```swift
/// tableView.register(StockItemCell.self, forCellReuseIdentifier: StockItemCell.identifier)
///
/// let cell = tableView.dequeueReusableCell(withIdentifier: StockItemCell.identifier) as? StockItemCell
/// cell?.configure(with: stock)
/// ```
class StockItemCell: UITableViewCell {
    
    /// The reuse identifier for registering and dequeuing the cell.
    static let identifier = String(describing: StockItemCell.self)
    
    /// Label for the stock symbol.
    let stockLabel = UILabel()
    
    /// Label for the trading volume.
    let volLabel = UILabel()
    
    /// Label for the trading frequency.
    let frqLabel = UILabel()
    
    /// Label for the previous price.
    let prevLabel = UILabel()
    
    /// Label for the price change.
    let changeLabel = UILabel()
    
    /// Label for the percentage change.
    let percentLabel = UILabel()
    
    /// Label for the current price.
    let priceLabel = UILabel()
    
    /// The horizontal stack view that arranges all labels.
    lazy var stack = UIStackView(arrangedSubviews: [
        stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel
    ])

    /// Initializes the cell with style and reuse identifier.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    /// Configures the cell’s view hierarchy, layout, and label styling.
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
    
    /// Sets up Auto Layout constraints for the stack view.
    private func setupConstraints() {
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    /// Configures the cell with a `Stock` instance.
    ///
    /// Sets the text for each label and updates the color of
    /// price-related labels based on whether the change is positive, negative, or neutral.
    ///
    /// - Parameter stock: The `Stock` model to display.
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

    /// Required initializer for storyboard or XIB usage.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
