//
//  WorldClockTVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 3/19/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class WorldClockTVC: UITableViewCell {

    @IBOutlet var timeZoneName: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
   
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
