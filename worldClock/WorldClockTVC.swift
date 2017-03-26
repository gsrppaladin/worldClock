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
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    
    func setTime() {
        timeLabel.text = getTime()
        
    }
    
    func getTime() -> String {
        var timeString = ""
        
        if timeZoneName.text != "" {
            
            let formatter = DateFormatter()
            formatter.timeStyle = .long //test this line to see which one you like more. 
            formatter.timeZone = TimeZone(identifier: timeZoneName.text!)
            
            let timeNow = Date()
            timeString = formatter.string(from: timeNow)
            
            
            
            
        }
        
        return timeString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
