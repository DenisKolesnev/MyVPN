//
//  MainPresenter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

protocol MainPresenterProtocol: AnyObject {
    func presentSelectCountryScreen()
}

final class MainPresenter {
    
    weak var viewController: MainDisplayProtocol?
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
}

extension MainPresenter: MainPresenterProtocol {
    
    func presentSelectCountryScreen() {
        router?.pushSelectCountryScreen()
    }
}
