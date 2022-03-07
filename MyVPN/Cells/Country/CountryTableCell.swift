//
//  CountryTableCell.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 8.03.22.
//

import UIKit

class CountryTableCell: UITableViewCell {

    @IBOutlet weak private var flagLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    
    var country: Country? {
        didSet {
            flagLabel.text = country?.flag
            nameLabel.text = country?.name
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        configureFlagLabel()
    }

    private func configureFlagLabel() {
        flagLabel.layer.borderWidth = 1
        flagLabel.layer.borderColor = UIColor.systemGray2.cgColor
        flagLabel.layer.cornerRadius = flagLabel.frame.height / 2
    }
}
