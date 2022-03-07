//
//  CountryTableViewDataSource.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

final class CountryTableViewDataSource: NSObject {
    
    private enum Constants {
        static let cellHeight: CGFloat = 50
    }
    
    // MARK: - Variables
    
    var presenter: SelectCountryPresenterProtocol?
    private var dataModel: SelectCountryDataModel?
    
    private var countries = [Country]()
    
    init(with dataModel: SelectCountryDataModel?) {
        super.init()
        self.dataModel = dataModel
    }
    
    // MARK: - Public Methods
    
    func updateTableView(with data: Countries, tableView: UITableView) {
        countries = data
        tableView.reloadData()
    }
}

extension CountryTableViewDataSource: UITableViewDelegate, UITableViewDataSource {
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryTableCell else {
            return UITableViewCell()
        }
        
        let country = countries[indexPath.row]
        cell.country = country
        cell.accessoryType = (country.name == dataModel?.selectedCountry.name ? .checkmark : .none)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedCountry = countries[indexPath.row]
        if let didSelect = dataModel?.didSelect {
            didSelect(selectedCountry)
        }
        presenter?.presentMainScreen(for: selectedCountry)
    }
}
