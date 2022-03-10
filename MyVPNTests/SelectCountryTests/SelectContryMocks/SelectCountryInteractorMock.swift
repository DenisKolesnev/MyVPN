//
//  SelectCountryInteractorMock.swift
//  MyVPNTests
//
//  Created by Denis Kolesnev on 10.03.22.
//

@testable import MyVPN

final class SelectCountryInteractorMock: SelectCountryInteractorProtocol {
    
    var setCountryName = ""
    var setCountryCallCount: Int = .zero
    var countries = [Country]()
    
    func getCountries() -> [Country] {
        countries
    }
    
    func setSelectedCountry(_ country: Country) {
        setCountryName = country.name
        setCountryCallCount += 1
    }
}
