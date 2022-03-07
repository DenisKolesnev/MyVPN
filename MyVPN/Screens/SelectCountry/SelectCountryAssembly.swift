//
//  SelectCountryAssembly.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

final class SelectCountryAssembly {

    static func build() -> UIViewController {
        
        let viewController = SelectCountryViewController()
        let interactor = SelectCountryInteractor()
        let router = SelectCountryRouter()
        let presenter = SelectCountryPresenter()
        
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.presenter = presenter
        router.presenter = presenter
        
        return viewController
    }
}
