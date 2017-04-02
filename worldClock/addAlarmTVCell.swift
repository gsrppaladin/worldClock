//
//  addAlarmTVCell.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/2/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class addAlarmTVCell: UITableViewCell {

    @IBOutlet var alarmLbl: UILabel!
    
    @IBOutlet var alarmSwitch: UISwitch!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
    }
    
    
    
    
}
