//
//  SelectCountryViewController.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

protocol SelectCountryDisplayProtocol: UIViewController {
    func displayCountries(data: Countries)
}

final class SelectCountryViewController: UIViewController {

    // MARK: - Variables
    
    var presenter: SelectCountryPresenterProtocol?
    var dataModel: SelectCountryDataModel?
    
    private let contentView = SelectCountryView()
    private var tableViewDataSource: CountryTableViewDataSource!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.presenter = presenter
        tableViewDataSource = CountryTableViewDataSource(with: dataModel)
        tableViewDataSource.presenter = presenter
        contentView.setupView(dataSource: tableViewDataSource)
        navigationItem.title = "Select Country"
    }
    
    override func loadView() {
        view = contentView
    }
}

extension SelectCountryViewController: SelectCountryDisplayProtocol {
    
    func displayCountries(data: Countries) {
        tableViewDataSource?.updateTableView(with: data, tableView: contentView.tableView)
    }
}
