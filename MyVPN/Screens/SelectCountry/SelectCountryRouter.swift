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

final class SelectCountryRouter: SelectCountryRouterProtocol {
    
    weak var presenter: SelectCountryPresenterProtocol?
    
    func navigateBack() {
        let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        navigationController?.popViewController(animated: true)
    }
}
