//
//  SelectCountryViewController.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//  
//

import UIKit

protocol SelectCountryDisplayProtocol: UIViewController {
    
}

final class SelectCountryViewController: UIViewController, SelectCountryDisplayProtocol {

    var presenter: SelectCountryPresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
