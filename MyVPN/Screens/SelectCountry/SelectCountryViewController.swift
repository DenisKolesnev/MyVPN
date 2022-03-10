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
    private var tableView: UITableView!
    private var dataSource: CountryTableViewDataSource!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = CountryTableViewDataSource(with: dataModel)
        dataSource.presenter = presenter
        navigationItem.title = "Select Country"
        setupView()
    }
}

// MARK: - SelectCountryDisplayProtocol conform Methods

extension SelectCountryViewController: SelectCountryDisplayProtocol {
    
    func displayCountries(data: Countries) {
        dataSource?.updateTableView(with: data, for: tableView)
    }
}

// MARK: - Private Methods

private extension SelectCountryViewController {

    func setupView() {
        view.backgroundColor = .systemBackground
        configureTableView()
        registerCell()
        setConstraints()
    }

    func configureTableView() {
        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        view.addSubview(tableView)
        presenter?.presentCountries()
    }
    
    func registerCell() {
        let nib = UINib(nibName: "CountryTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CountryCell")
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
