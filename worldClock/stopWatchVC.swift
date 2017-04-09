//
//  stopWatchVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/9/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class stopWatchVC: UIViewController {

    
    @IBOutlet var stopWatchLbl: UILabel!
    
    @IBOutlet var lapsTableView: UITableView!
    
    @IBOutlet var startBtn: UIButton!
    
    @IBOutlet var lapBtn: UIButton!
    
    var timer = Timer()
    
    var minutes = 0
    
    var seconds = 0
    
    var fractions = 0
    
    var stopWatchString = ""
    
    //need to track the state of stopwatch, so it knows when to start or stop. also so it can change image of the buttons.
    
    var startStopWatch = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopWatchLbl.text = "00:00:00"
        
        
    }

    
    
    func updateStopwatch() {
        //every 1/100th of a second, the function will be called.
        
        fractions += 1
        
        
        //if fractions is equal to a 100, we need to increase the seconds by one. this starts the process of increasing the timer past the fraction Int.
        
        if fractions == 100 {
            
            seconds += 1
            //it is then that it goes back to 0, so that it coincides with the seconds.
            fractions = 0
        }
        
        //in the same way, we have to stop seconds at 60 and then start increasing the minutes.
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        //now we need to construct our stopwatch string. 
        //since we dont want the digit to go past 9, we need to set it to the starting point numbers. 
        //if fractions is greater than 9 then return something, otherwise return something different. In both we will need the fractions. but if it is greater than nine, return it as fractions, otherwise prefix it with 0.
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopWatchString = "\(minutesString):\(secondsString):\(fractionsString)"
        
        stopWatchLbl.text = stopWatchString
        
        
    }
    
    

    @IBAction func startPressed(_ sender: UIButton) {
        if startStopWatch {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
        
            //RunLoop is something in XCode.
            RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
            
            startStopWatch = false
            //now we need to changes images.
            
            startBtn.setImage(UIImage(named: "stop"), for: .normal)
            
            
            lapBtn.setImage(UIImage(named: "lap"), for: .normal)
        } else {
            
            timer.invalidate()
            startStopWatch = true
            
            startBtn.setImage(UIImage(named: "start"), for: .normal)
            lapBtn.setImage(UIImage(named: "reset"), for: .normal)
            
        }

    }
    
    
    
    @IBAction func lapPressed(_ sender: UIButton) {
        
        
    }
    
    

    
    
}
