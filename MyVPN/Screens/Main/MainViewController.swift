//
//  MainViewController.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

protocol MainDisplayProtocol: UIViewController {
    func displayCountry(_ country: Country)
}

final class MainViewController: UIViewController {

    // MARK: - Variables
    
    var presenter: MainPresenterProtocol?
    private var selectedCountry: Country!
    
    // MARK: - Outlets
    
    @IBOutlet weak private var countryLabel: UILabel!
    @IBOutlet weak private var connectButton: UIButton!
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSelectedCountry()
    }
    
    // MARK: - Private Methods
    
    private func loadSelectedCountry() {
        if let selectedCountry = UserDefaultService.shared.selectedCountry {
            self.selectedCountry = selectedCountry
        } else {
            self.selectedCountry = Country(flag: "🇧🇾", name: "Belarus")
        }
        
        displayCountry(selectedCountry)
    }

    // MARK: - Actions
    
    @IBAction func selectCountryTapped(_ sender: UIBarButtonItem) {
        presenter?.presentSelectCountryScreen(selectedCountry)
    }
}

extension MainViewController: MainDisplayProtocol {
    
    func displayCountry(_ country: Country) {
        countryLabel.text = "\(country.flag) \(country.name)"
        selectedCountry = country
    }
}
