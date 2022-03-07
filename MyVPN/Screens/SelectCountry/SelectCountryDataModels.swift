//
//  SelectCountryDataModels.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

struct SelectCountryDataModel {
    var selectedCountry: Country
    var didSelect: ((Country) -> Void)?
}

struct Country: Codable {
    var flag: String
    var name: String
}

typealias Countries = [Country]
