//
//  MainPresenter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

protocol MainPresenterProtocol: AnyObject {
    func presentSelectCountryScreen(_ country: Country)
    func presentCountry(_ country: Country)
}

final class MainPresenter {
    weak var viewController: MainDisplayProtocol?
    var router: MainRouterProtocol?
}

// MARK: - MainPresenterProtocol confirm Methods

extension MainPresenter: MainPresenterProtocol {
    
    func presentSelectCountryScreen(_ country: Country) {
        router?.pushSelectCountryScreen(selected: country)
    }
    
    func presentCountry(_ country: Country) {
        viewController?.displayCountry(country)
    }
}
