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
    weak var viewController: SelectCountryDisplayProtocol?
    var interactor: SelectCountryInteractorProtocol?
    var router: SelectCountryRouterProtocol?
}

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
