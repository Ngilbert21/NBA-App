//
//  StadiumCell.swift
//  NBAapp
//
//  Created by Nicholas Gilbert on 8/20/21.
//

import UIKit

class StadiumCell: UITableViewCell {

    // MARK: - static properties
    static let identifier = "StadiumCell"
    
    // MARK: - IBOutlet properties
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var zipLabel: UILabel!
    
    func configureCell(name: String?, address: String?, city: String?, state: String?, zip: String?) {
        nameLabel.text = name
        addressLabel.text = address
        cityLabel.text = city
        stateLabel.text = state
        zipLabel.text = zip
    }
    
}
