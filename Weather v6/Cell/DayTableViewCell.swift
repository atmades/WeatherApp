//
//  DayTableViewCell.swift
//  Weather v6
//
//  Created by Максим on 30.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {
        
    @IBOutlet weak var temperatura: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
