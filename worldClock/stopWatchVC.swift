//
//  stopWatchVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/9/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class stopWatchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
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
    
    
    var laps = [String]()
    //this bool is used to tell that it can or cannot make a lap appear in the tableView.
    var addLap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopWatchLbl.text = "00:00:00"
        lapsTableView.delegate = self
        lapsTableView.dataSource = self
        
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
            
            addLap = true
            lapBtn.setImage(UIImage(named: "lap"), for: .normal)
        } else {
            
            timer.invalidate()
            startStopWatch = true
            
            startBtn.setImage(UIImage(named: "start"), for: .normal)
            lapBtn.setImage(UIImage(named: "reset"), for: .normal)
            
            addLap = false
        }

    }
    
    
    
    @IBAction func lapPressed(_ sender: UIButton) {
        
        //dont forget that if it isnt declared, it becomes automatically true in swift.  this statement means if addLap is true {}.
        
        if addLap {
            //the other elements will be pushed down, meaning that the most recent one will appear at the top of the tableView. 
            //this statement is basically saying that for the array laps, insert the stopWatchString, which holds the timer at the 0 index.
            laps.insert(stopWatchString, at: 0)
            lapsTableView.reloadData()
            
        } else {
            //if addLap is false, then that means that we are at the reset part. 
            //we should be able to reset our stopwatch, because addLap should be equal to false. 
            
            //we need to reset everything in the UI so that it can be run again.
            lapBtn.setImage(UIImage(named: "lap"), for: .normal)
            laps.removeAll()
            lapsTableView.reloadData()
            fractions = 0
            seconds = 0
            minutes = 0
            
            stopWatchString = "00:00:00"
            stopWatchLbl.text = stopWatchString
        }
        
    }
    
    //Mark: TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        
         cell.textLabel?.text = "Lap \(laps.count - indexPath.row)"
        cell.detailTextLabel?.text = "\(laps[indexPath.row])"
        
        return cell
    }
    

    
    
}
