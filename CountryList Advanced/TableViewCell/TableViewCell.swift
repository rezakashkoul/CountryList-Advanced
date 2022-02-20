//
//  TableViewCell.swift
//  CountryList Advanced
//
//  Created by Reza Kashkoul on 1/12/1400 AP.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
