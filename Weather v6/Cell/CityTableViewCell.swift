//
//  CityTableViewCell.swift
//  Weather v6
//
//  Created by Максим on 21.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfCity: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


