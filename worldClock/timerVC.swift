//
//  timerVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/9/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class timerVC: UIViewController {

    
    @IBOutlet var timerPicker: UIDatePicker!
    
    @IBOutlet var displayLbl: UILabel!
    
    @IBOutlet var pauseBtn: UIButton!
    
    @IBOutlet var startBtn: UIButton!
    
    
    var timer = Timer()
    
    var seconds = 0
    
    var startTimer = true
    var canPause = false
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayLbl.text = ""
        displayLbl.isHidden = true
        pauseBtn.isEnabled = false
        
        
    }

    
    @IBAction func startPressed(_ sender: UIButton) {
        //remember that this means that if startTimer is equal to true.
        if startTimer {
            displayLbl.text = ""
            let formatter = DateFormatter()
            formatter.dateFormat = "HH" //this is hour number
            let hours = Int(formatter.string(from: timerPicker.date))
            formatter.dateFormat = "mm" //this is minute number
            let minutes = Int(formatter.string(from: timerPicker.date))
            
            //seconds are hours into 60 into 60 is seconds. plus minutes into 60. that is total seconds.
            seconds = hours! * 60 * 60 + minutes! * 60
            
            startBtn.setImage(UIImage(named: "timer_cancel"), for: .normal)
            pauseBtn.isEnabled = true
            pauseBtn.setImage(UIImage(named: "timer_pause"), for: .normal)
            
            timerPicker.isHidden = true
            displayLbl.isHidden = false
            startTimer = false
            canPause = true
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        } else {
            //this means that if startTimer is false.
            
            startBtn.setImage(UIImage(named: "timer_start"), for: .normal)
            pauseBtn.setImage(UIImage(named: "timer_pause"), for: .normal)
            pauseBtn.isEnabled = false
            
            timerPicker.isHidden = false
            displayLbl.isHidden = true
            startTimer = true
            canPause = false
            timer.invalidate() //this stops timer
            
            
        }
        
    }
    
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if canPause {
            timer.invalidate()
            canPause = false
            //already paused, can't pause again. 
            pauseBtn.setImage(UIImage(named: "timer_resume"), for: .normal)
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
            canPause = true
            pauseBtn.setImage(UIImage(named: "timer_pause"), for: .normal)
        }
        
    }
    
    func updateLabel() {
        
        //need to eventually stop timer
        
        if seconds <= 0 {
            timer.invalidate()
            return
        }
        
        seconds -= 1
        print(seconds)
        //need to grab the seconds and get hours and minutes from them, since the timer makes seconds. 
        //remember that you need to use remainder "%".
        
        
        let displayHours = seconds / 3600
        let remainingSeconds = seconds % 3600
        
        let displayMinutes = remainingSeconds / 60
        let displaySeconds = remainingSeconds % 60
        
        
        
        let hoursString = displayHours > 9 ? "\(displayHours)" : "0\(displayHours)"
        let minutesString = displayMinutes > 9 ? "\(displayMinutes)" : "0\(displayMinutes)"
        let secondsString = displaySeconds > 9 ? "\(displaySeconds)" : "0\(displaySeconds)"
        
        displayLbl.text = "\(hoursString):\(minutesString):\(secondsString)"
        
    
    
    }
    
    
    
    
    
    
    

}
