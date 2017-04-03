//
//  alarmTVC.swift
//  worldClock
//
//  Created by Sam Greenhill on 4/2/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class alarmTVC: UITableViewController, AddAlarmProtocol {

    //will need an array for store the datasource. This basically holds all the alarms that are made, like the one made in the world clock.
    
    var alarmArray = [alarmObject]()
    
    
    
    //AddAlarmProtocol will cause an error, if you dont conform to the delegate, which are the two functions below.
    //with the help of these two functions, we can construct a new alarm object, and add it to the alarmArray, then can say tableView reload data.
    func addAlarm(alarmTime: Date, switchValue: Bool) {
        let newAlarm = alarmObject(alarmTime: alarmTime, alarmActive: switchValue)
        alarmArray.append(newAlarm)
        tableView.reloadData()
        
        
        //register new notifcation here.
        //whenever adding a new alarm we are register the notifcation aswell. so that we some sound can be played when that alarm goes off.
        
        
    }
    
    func updateAlarm(alarmTime: Date, switchValue: Bool, index: Int) {
        let existingAlarm = alarmObject(alarmTime: alarmTime, alarmActive: switchValue)
        alarmArray[index] = existingAlarm //should test to see if this works by commenting it out.
        //i think this adds this to the array.
        //this is how we update.
        tableView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alarmArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! addAlarmTVCell

        // Configure the cell...

        
        //we have the date and we want to format that date so that it only displays the time part only. The way to do this is with a formatter.
        let formatter = DateFormatter()
        //this is what gives it the time
        formatter.timeStyle = .short
        //now we grab the alarm time and it comes from the alarm array.
        let alarmTime = alarmArray[indexPath.row].alarmTime
        //then we grab the time String. which we get from the alarm time.
        let timeString = formatter.string(from: alarmTime)
        
        //this makes the label in the cell equal to the time that is set.
        cell.alarmLbl.text = timeString
        
        //this turns the alarm on, and we set this early on.
        cell.alarmSwitch.isOn = alarmArray[indexPath.row].alarmActive
        
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            alarmArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        let dVC = segue.destination as! addAlarmVC
        dVC.delegate = self
        
        //this adds the new alarm to the tableView. 
        
        if segue.identifier == "newSegue" {
            
            dVC.addNew = true
            
        } else if segue.identifier == "editSeque" {
            dVC.addNew = false
            
            //this grabs the index
            let index = (tableView.indexPathForSelectedRow?.row)!
            let existingAlarm = alarmArray[index]
            
            dVC.existingAlarm = existingAlarm
            dVC.updateIndex = index
            
        }
        
        
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    

}
