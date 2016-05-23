//
//  StateTableViewController.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import CoreData


class StatesTableViewController: UITableViewController {
    
    var stateData = StateData()
    
    
    var states: Dictionary<String, String> {
        get {
            return stateData.states
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do stuff here when the view first loads
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return states.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
