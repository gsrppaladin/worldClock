//
//  addAlarmTVCell.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/2/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

protocol UpdateSwitchValueProtocol {
    func updateAlarmSwitch(at: Int, value: Bool)
    
}

class addAlarmTVCell: UITableViewCell {

    @IBOutlet var alarmLbl: UILabel!
    
    @IBOutlet var alarmSwitch: UISwitch!
    
    var delegate: UpdateSwitchValueProtocol?
    //this delegate is connected to this cell because because we are in a teableViewCell class. to set up cell we have a method in tableviewController for rowatindexpath. for each cell we are setting the delegate to self. 
    
    
    var cellIndex: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        
        //with help of delegate we are calling this updateAlarmSwitch and passing the index and grabbing the index at rowforindexpath, 
        //when changing the value to either true or false, but what ever the value is, pass it.
        delegate?.updateAlarmSwitch(at: cellIndex, value: sender.isOn)

    }
    
    
    
    
}


































