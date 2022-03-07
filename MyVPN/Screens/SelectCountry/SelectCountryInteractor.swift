//
//  SelectCountryInteractor.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import Foundation

protocol SelectCountryInteractorProtocol: AnyObject {
    func getCountries() -> [Country]
    func setSelectedCountry(_ country: Country)
}

final class SelectCountryInteractor: SelectCountryInteractorProtocol {

    func getCountries() -> Countries {
        // В реальном проекте этот массив заполнялся бы или из базы данных, или с сервера
        [
            Country(flag: "🇧🇾", name: "Belarus"),
            Country(flag: "🇷🇺", name: "Russia"),
            Country(flag: "🇺🇸", name: "USA"),
            Country(flag: "🇯🇵", name: "Japan"),
            Country(flag: "🇫🇷", name: "France"),
            Country(flag: "🇮🇹", name: "Italy"),
            Country(flag: "🇩🇪", name: "Germany"),
            Country(flag: "🇵🇱", name: "Poland"),
            Country(flag: "🇧🇷", name: "Brasil"),
            Country(flag: "🇦🇷", name: "Argentina")
        ].sorted { $0.name < $1.name }
    }
    
    func setSelectedCountry(_ country: Country) {
        UserDefaultService.shared.selectedCountry = country
    }
}
