//
//  addAlarmVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/2/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

protocol AddAlarmProtocol {
    func addAlarm(alarmTime: Date, switchValue: Bool)
    func updateAlarm(alarmTime: Date, switchValue: Bool, index: Int)
}


class addAlarmVC: UIViewController {

    
    
    
    @IBOutlet var alarmTime: UIDatePicker!
    
    var delegate: AddAlarmProtocol?
    //now we call call the functions from this protocol. 
    
    var addNew: Bool = true
    //this is the bool we will use to determine if we are adding an alarm, or updating an alarm. 
    
    //when tansitioning between the twpo viewControllers, we will set this bool depending on the seque that is pressed. This is why there are two segues that are set up. 
    
    
    
    
    //for existing alarm, will need to be set from alarm table VC in prepare for seque method.
    
    var existingAlarm: alarmObject?
    //this connects to the helperClass swift file. 
    
    var updateIndex: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        //this will need to check that if there is an existing alarm, this is why the alarm is configured as an optional.
        
        //below means that this object has been set. now we can load our alarmTime from the datepicker.
        if let alarm = existingAlarm {
            alarmTime.setDate(alarm.alarmTime, animated: true)
            //everytime an existing alarm is pressed my date picker will be set to that time already on the date picker.
        }
    }
    
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        //this just cancels it.
    }
    
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        //there are two cases here, creating a new alarm, or updating an existing alarm. 
        
        let alarm = alarmTime.date
        //this is the datePicker that chooses the time. 
        //saving the date for easy access in the alarm variable above. 
        
        
        //below is equivalent to if addNew == true.
        if addNew {
            //adding a new alarm.
            delegate?.addAlarm(alarmTime: alarm, switchValue: true)
        } else {
            //updating an existing alarm
            
            delegate?.updateAlarm(alarmTime: alarm, switchValue: existingAlarm!.alarmActive, index:updateIndex!)
            
        }
        //for either case, whether it is add new or update after this complete if statement, need to dismiss it, so it goes back to the tableVC. 
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
