//
//  MainViewController.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

protocol MainDisplayProtocol: UIViewController {
    
}

class MainViewController: UIViewController, MainDisplayProtocol {

    // MARK: - Variables
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var selectCountryButton: UIBarButtonItem!
    @IBOutlet weak private var countryLabel: UILabel!
    @IBOutlet weak private var connectButton: UIButton!
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func selectCountryTapped(_ sender: UIBarButtonItem) {
        presenter?.presentSelectCountryScreen()
    }
}
