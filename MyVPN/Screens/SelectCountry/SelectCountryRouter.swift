//
//  SelectCountryRouter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

protocol SelectCountryRouterProtocol {
    func navigateBack()
}

final class SelectCountryRouter {
    
    // MARK: - Variables
    
    weak var presenter: SelectCountryPresenterProtocol?
}

// MARK: - SelectCountryRouterProtocol conform Methods

extension SelectCountryRouter: SelectCountryRouterProtocol {
    
    func navigateBack() {
        let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        navigationController?.popViewController(animated: true)
    }
}
