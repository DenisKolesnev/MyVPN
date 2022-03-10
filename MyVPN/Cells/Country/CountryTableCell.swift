//
//  CountryTableCell.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 8.03.22.
//

import UIKit

class CountryTableCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak private var flagLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    
    // MARK: - Variables
    
    var country: Country? {
        didSet {
            flagLabel.text = country?.flag
            nameLabel.text = country?.name
        }
    }
    
    // MARK: - Overrided Methods
        
    override func awakeFromNib() {
        super.awakeFromNib()
        configureFlag()
    }
}

// MARK: - Private Methods

private extension CountryTableCell {
    
    private func configureFlag() {
        flagLabel.layer.borderWidth = 1
        flagLabel.layer.borderColor = UIColor.systemGray2.cgColor
        flagLabel.layer.cornerRadius = flagLabel.frame.height / 2
    }
}
