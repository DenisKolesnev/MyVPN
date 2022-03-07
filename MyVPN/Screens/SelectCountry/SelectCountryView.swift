//
//  SelectCountryView.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

final class SelectCountryView: UIView {
    
    // MARK: - Variables
    
    var presenter: SelectCountryPresenterProtocol?
    var tableView: UITableView!
    var tableViewDataSource: CountryTableViewDataSource?

    // MARK: - Public Methods
    
    func setupView(dataSource: CountryTableViewDataSource) {
        backgroundColor = .systemBackground
        configureTableView(with: dataSource)
        registerCell()
        setConstraints()
    }
    
    // MARK: - Private Methods
    
    private func configureTableView(with dataSource: CountryTableViewDataSource) {
        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        addSubview(tableView)
        presenter?.presentCountries()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CountryTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CountryCell")
    }
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
