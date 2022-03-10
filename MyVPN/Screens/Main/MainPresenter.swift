//
//  MainPresenter.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func presentSelectCountryScreen(_ country: Country)
    func presentCountry(_ country: Country)
    func presentConnect()
}

final class MainPresenter {
    weak var viewController: MainDisplayProtocol?
    var router: MainRouterProtocol?
    private var timer: Timer?
}

// MARK: - MainPresenterProtocol confirm Methods

extension MainPresenter: MainPresenterProtocol {
    
    func presentSelectCountryScreen(_ country: Country) {
        router?.pushSelectCountryScreen(selected: country)
    }
    
    func presentCountry(_ country: Country) {
        viewController?.displayCountry(country)
    }
    
    func presentConnect() {
        if connect() {
            viewController?.displayConnect()
        }
    }
}

// MARK: - Private Methods

private extension MainPresenter {
    
    func connect() -> Bool {
        // Иммитируем подключение
        if timer == nil {
            let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] _ in
                self?.disconnect()
            }
            self.timer = timer
        }
        return true
    }
    
    func disconnect() {
        timer = nil
        viewController?.displayDisconnect()
    }
}
