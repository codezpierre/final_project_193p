//
//  TravelHistoryTableViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import CoreData


class TravelHistoryTableViewController: UITableViewController {
    
    var trips: [Trip]? {
        didSet{
            updateUI()
        }
    }
    
    
    //var city: [City]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var managedObjectContext: NSManagedObjectContext? {
        return ((UIApplication.sharedApplication().delegate) as? AppDelegate)?.managedObjectContext
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        do {
            if let fetchResults = try managedObjectContext!.executeFetchRequest(fetchRequest) as? [Trip] {
                trips = fetchResults
            }
        } catch {
            print(error)
        }
    }
    
    private func updateUI() {
        tableView.reloadData() //redraws UI
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
        if trips == nil {
            return 0
        } else {
            return trips!.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("travelHistoryCell", forIndexPath: indexPath)
        
        let trip = trips![indexPath.row]
        
        if let tripCell = cell as? TravelHistoryTableViewCell {
            tripCell.trip = trip
            //            let imageData = trip.image
            //            tripCell.tripImageView = UIImageView(data: imageData!)
            //            tripCell.destinationLabel = trip.destination
            //            tripCell.departDateLabel = trip.departureDate
            //            tripCell.returnDateLabel = trip.returnDate
        }
        
        
        //        let imageData = trip.image
        //        let destinationText = trip.destination
        //        cell.imageView?.image = UIImage(data: imageData!)
        //        cell.text
        //        cell.textLabel?.text = trip.destination
        //        //cell.imageView?.image = trip.image
        
        
        return cell
    }
    
    //unwinding from NewTripPickerVC
    @IBAction func saveNewTrip(unwindsegue: UIStoryboardSegue) {
       // performSegueWithIdentifier("unwindFromNewTripDone", sender: NewTripViewController())
//        let fetchRequest = NSFetchRequest(entityName: "Trip")
//        do {
//            if let fetchResults = try managedObjectContext!.executeFetchRequest(fetchRequest) as? [Trip] {
//                trips = fetchResults
//            }
//        } catch {
//            print(error)
//        }
        //updateUI()
        
        
    }

    
   /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
 */
}
