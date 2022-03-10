//
//  SelectCountryViewControllerMock.swift
//  MyVPNTests
//
//  Created by Denis Kolesnev on 10.03.22.
//

import UIKit
@testable import MyVPN

final class SelectCountryViewControllerMock: UIViewController, SelectCountryDisplayProtocol {
    
    var displayedCountriesCount: Int = .zero
    var firstDisplayedCountryName: String?
    var displayCountriesCallCount: Int = .zero
    
    func displayCountries(data: Countries) {
        displayedCountriesCount = data.count
        firstDisplayedCountryName = data.first?.name
        displayCountriesCallCount += 1
    }
}
