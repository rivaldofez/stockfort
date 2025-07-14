//
//  StockHeaderCell.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit

/// `StockHeaderCell` is a custom `UITableViewCell` used as a header row for the stock list.
///
/// This cell displays column headers for the stock table:
/// - Stock symbol (`STOCK`)
/// - Volume (`VOL`)
/// - Frequency (`FRQ`)
/// - Previous price (`PREV`)
/// - Price change (`+/-`)
/// - Percentage change (`%`)
/// - Current price (`PRICE`)
///
/// The labels are arranged horizontally using a `UIStackView`
/// to align with the columns in `StockItemCell`.
///
/// Example usage:
/// ```swift
/// func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
///     let headerCell = StockHeaderCell()
///     return headerCell.contentView
/// }
/// ```
class StockHeaderCell: UITableViewCell {

    /// The reuse identifier for registering or dequeuing the header cell.
    static let identifier = String(describing: StockHeaderCell.self)
    
    /// Label for the stock symbol column header.
    let stockLabel = UILabel()
    
    /// Label for the volume column header.
    let volLabel = UILabel()
    
    /// Label for the frequency column header.
    let frqLabel = UILabel()
    
    /// Label for the previous price column header.
    let prevLabel = UILabel()
    
    /// Label for the price change column header.
    let changeLabel = UILabel()
    
    /// Label for the percentage change column header.
    let percentLabel = UILabel()
    
    /// Label for the current price column header.
    let priceLabel = UILabel()
    
    /// The horizontal stack view containing all header labels.
    lazy var stack = UIStackView(arrangedSubviews: [
        stockLabel, volLabel, frqLabel, prevLabel, changeLabel, percentLabel, priceLabel
    ])
    
    /// Initializes the header cell with style and reuse identifier.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    /// Configures the header cell’s layout, label texts, and appearance.
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
    
    /// Sets up Auto Layout constraints for the stack view inside the cell.
    private func setupConstraints() {
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }

    /// Required initializer for storyboard or XIB usage.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
