//
//  MainRouter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

protocol MainRouterProtocol {
    func pushSelectCountryScreen()
}

final class MainRouter: MainRouterProtocol {
    
    weak var presenter: MainPresenterProtocol?
        
    func pushSelectCountryScreen() {
        let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        let selectCountryViewController = SelectCountryAssembly.build()
        navigationController?.pushViewController(selectCountryViewController, animated: true)
    }
}
