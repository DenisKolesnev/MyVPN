//
//  MainViewController.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

protocol MainDisplayProtocol: UIViewController {
    func displayCountry(_ country: Country)
    func displayConnect()
    func displayDisconnect()
}

final class MainViewController: UIViewController {

    // MARK: - Variables
    
    var presenter: MainPresenterProtocol?
    private var selectedCountry: Country!
    
    // MARK: - Outlets
    
    @IBOutlet weak private var countryLabel: UILabel!
    @IBOutlet weak private var connectButton: UIButton!
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSelectedCountry()
    }

    // MARK: - Actions
    
    @IBAction func selectCountryTapped(_ sender: UIBarButtonItem) {
        presenter?.presentSelectCountryScreen(selectedCountry)
    }
    
    @IBAction func connectButtonTapped(_ sender: UIButton) {
        presenter?.presentConnect()
    }
}

// MARK: - MainDisplayProtocol conform Methods

extension MainViewController: MainDisplayProtocol {
    
    func displayCountry(_ country: Country) {
        countryLabel.text = "\(country.flag) \(country.name)"
        selectedCountry = country
    }
    
    func displayConnect() {
        // Тут мог бы быть вызов методов, которые еще как-нибудь меняли бы интерфейс при начале соединения
        connectButton.isEnabled = false
        connectButton.setTitle("Connected", for: .normal)
        startConnectAnimation()
    }
    
    func displayDisconnect() {
        // Тут мог бы быть вызов методов, которые еще как-нибудь меняли бы интерфейс при окончании соединения
        // Допустим, вызов алерта "Соединение разорвано"
        connectButton.isEnabled = true
        connectButton.setTitle("Tap to Connect", for: .normal)
        stopConnectAnimation()
    }
}

// MARK: - Private Methods

private extension MainViewController {
    
     func loadSelectedCountry() {
        if let selectedCountry = UserDefaultsService.shared.selectedCountry {
            self.selectedCountry = selectedCountry
        } else {
            self.selectedCountry = Country(flag: "🇧🇾", name: "Belarus")
        }
        
        displayCountry(selectedCountry)
    }
    
    func startConnectAnimation() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 1
        animation.fromValue = UIColor.secondarySystemFill.cgColor
        animation.toValue = UIColor.systemGreen.cgColor
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = .greatestFiniteMagnitude
        connectButton.layer.add(animation, forKey: nil)
    }
    
    func stopConnectAnimation() {
        connectButton.layer.removeAllAnimations()
    }
}
