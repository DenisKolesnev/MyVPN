//
//  SelectCountryPresenterTests.swift
//  MyVPNTests
//
//  Created by Denis Kolesnev on 10.03.22.
//

import XCTest
@testable import MyVPN

class SelectCountryPresenterTests: XCTestCase {

    private var interactor: SelectCountryInteractorMock!
    private var viewController: SelectCountryViewControllerMock!
    private var presenter: SelectCountryPresenter!
    
    override func setUp() {
        interactor = SelectCountryInteractorMock()
        viewController = SelectCountryViewControllerMock()
        presenter = SelectCountryPresenter()
        presenter.interactor = interactor
        presenter.viewController = viewController
    }

    override func tearDown() {
        interactor = nil
        viewController = nil
        presenter = nil
    }

    func testPresentCountries() {
        let testCountries = [
            Country(flag: "", name: "Belarus"),
            Country(flag: "", name: "Russia")
        ]
        interactor.countries = testCountries
        presenter.presentCountries()
        XCTAssertEqual(viewController.displayedCountriesCount, 2)
        XCTAssertEqual(viewController.displayCountriesCallCount, 1)
        XCTAssertEqual(viewController.firstDisplayedCountryName, "Belarus")
    }
    
    func testPresentMainScreen() {
        let testCountry = Country(flag: "", name: "USA")
        presenter.presentMainScreen(for: testCountry)
        XCTAssertEqual(interactor.setCountryCallCount, 1)
        XCTAssertEqual(interactor.setCountryName, "USA")
    }
}
