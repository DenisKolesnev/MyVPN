//
//  MainRouter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

protocol MainRouterProtocol {
    func pushSelectCountryScreen(selected country: Country)
}

final class MainRouter {
    weak var presenter: MainPresenterProtocol?
}

// MARK: - MainRouterProtocol conform Methods

extension MainRouter: MainRouterProtocol {
    
    func pushSelectCountryScreen(selected country: Country) {
        let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        let dataModel = SelectCountryDataModel(selectedCountry: country) { [weak self] selectedCountry in
            self?.presenter?.presentCountry(selectedCountry)
        }
        let selectCountryViewController = SelectCountryAssembly.build(model: dataModel)
        navigationController?.pushViewController(selectCountryViewController, animated: true)
    }
}
