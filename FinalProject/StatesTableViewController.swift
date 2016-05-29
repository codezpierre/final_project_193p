//
//  StateTableViewController.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import CoreData


class StatesTableViewController: CoreDataTableViewController {
    
    var context = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    var stateData = StateData()
    
    var currCity: String?
    
    
    private func updateDatabase(states: Dictionary<String, String>) {
        context?.performBlock {
            for (state, capital) in states {
                let currState = State.addState(state, context: self.context!)
                if let currCity = City.addCity(capital, context: self.context!) {
                    currCity.isCapital = true
                    currState?.mutableSetValueForKey("cities").addObject(currCity)
                }
            }
        }
        do {
            try self.context?.save()
        } catch let error {
            print("Core Data Error: \(error)")
        }
    }
    
    
    var states: Dictionary<String, String> {
        get {
            return stateData.states
        }
    }
    
    private func updateUI() {
        let request = NSFetchRequest(entityName: "State")
        request.sortDescriptors = [NSSortDescriptor(key: "stateText", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context!,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDatabase(states)
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        //maybe add a way to count the number of instances of an entity in a database here
    //        return states.count
    //    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)
        
        if let state = fetchedResultsController?.objectAtIndexPath(indexPath) as? State {
            var stateText: String?
            var cityText: String?
            state.managedObjectContext?.performBlockAndWait {
                stateText = state.stateText
                
                
                let request = NSFetchRequest(entityName: "City")
                request.predicate = NSPredicate(format: "state.stateText = %@ && isCapital = %@", stateText!, true)
                if let city = (try? self.context?.executeFetchRequest(request))??.first as? City {
                    cityText = city.cityText
                }
            }
            cell.textLabel?.text = stateText
            cell.detailTextLabel?.text = cityText
        }
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let stateCell = sender as? UITableViewCell {
            if let state = stateCell.textLabel?.text{
                if let city = stateCell.detailTextLabel?.text {
                    if let mapvc = segue.destinationViewController as? StateMapViewController {
                        mapvc.city = "\(city), \(state)"
                    }
                }
            }
        }
    }
    
}
