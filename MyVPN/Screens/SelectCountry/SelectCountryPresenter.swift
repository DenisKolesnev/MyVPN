//
//  SelectCountryPresenter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

protocol SelectCountryPresenterProtocol: AnyObject {
    func presentCountries()
    func presentMainScreen(for country: Country)
}

final class SelectCountryPresenter {
    
    // MARK: - Variables
    
    weak var viewController: SelectCountryDisplayProtocol?
    var interactor: SelectCountryInteractorProtocol?
    var router: SelectCountryRouterProtocol?
}

// MARK: - SelectCountryPresenterProtocol conform Methods

extension SelectCountryPresenter: SelectCountryPresenterProtocol {
    
    func presentCountries() {
        if let countries = interactor?.getCountries() {
            viewController?.displayCountries(data: countries)
        }
    }
    
    func presentMainScreen(for country: Country) {
        interactor?.setSelectedCountry(country)
        router?.navigateBack()
    }
}
