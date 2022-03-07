//
//  SelectCountryPresenter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

protocol SelectCountryPresenterProtocol: AnyObject {
}

final class SelectCountryPresenter {

    weak var viewController: SelectCountryDisplayProtocol?
    var interactor: SelectCountryInteractorProtocol?
    var router: SelectCountryRouterProtocol?

}

extension SelectCountryPresenter: SelectCountryPresenterProtocol {
    
}
