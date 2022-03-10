//
//  UserDefaultsService.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 8.03.22.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    var selectedCountry: Country? { get set }
}

final class UserDefaultsService {
    
    // MARK: - UserDefaults Keys
    
    private enum UserDefaultsKeys: String {
        case selectedCountry
    }

    // MARK: - Variables
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Singleton

    static let shared = UserDefaultsService()
    private init() { }
}

// MARK: - UserDefaultServiceProtocol conform Methods

extension UserDefaultsService: UserDefaultsServiceProtocol {
    
    var selectedCountry: Country? {
        get {
            guard let data = userDefaults.value(forKey: UserDefaultsKeys.selectedCountry.rawValue) as? Data else { return nil }
            return try? PropertyListDecoder().decode(Country.self, from: data)
        }
        set {
            let data = try? PropertyListEncoder().encode(newValue)
            userDefaults.set(data, forKey: UserDefaultsKeys.selectedCountry.rawValue)
        }
    }
}
