//
//  ViewController.swift
//  StockFort
//
//  Created by Rivaldo Fernandes on 14/07/25.
//

import UIKit


/// `StockListViewController` is the View layer in the VIPER architecture for the stock list feature.
///
/// This view controller:
/// - Displays a list of stocks in a table view.
/// - Communicates user events to the Presenter.
/// - Reloads the table view when data changes.
///
/// It is configured with its `presenter` externally (via the Router).
///
/// Example usage:
/// ```swift
/// let router = StockListRouter.start()
/// let viewController = router.entryPoint
/// ```
class StockListViewController: UIViewController {
    /// The Presenter which provides data and handles business logic.
    var presenter: StockListPresenter?

    /// The main table view displaying the list of stocks.
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        setupTableView()
        presenter?.notifyViewDidLoad()
    }
    
    /// Configures the view controller’s appearance, including title and background color.
    private func setupView() {
        title = "Stock Ticker"
        
        setupTableView()
    }
    
    /// Sets up the table view:
        /// - Adds it to the view hierarchy.
        /// - Sets its frame, delegate, and data source.
        /// - Registers the custom cell.
        /// - Configures row height and scroll indicators.
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
    /// Returns the number of rows in the section, based on the Presenter’s stock data.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.stockData.count ?? 0
    }
    
    /// Returns the number of sections in the table view. Always 1.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Configures and returns the cell for a given row.
    ///
    /// This dequeues a `StockItemCell` and passes the corresponding `Stock` to configure its content.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockItemCell.identifier, for: indexPath) as? StockItemCell,
              let stock = presenter?.stockData[indexPath.row] else { return UITableViewCell() }
        
        cell.configure(with: stock)

        return cell
    }
    
    /// Returns the height for the table view’s header in the section.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    /// Returns the custom header view for the section.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = StockHeaderCell()
        return header.contentView
    }
}
