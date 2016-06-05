//
//  TravelHistoryTableViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import CoreData

class TravelHistoryTableViewController: UITableViewController, UITextFieldDelegate {
    private var cellSize: CGSize? = nil
    
    var trips: [Trip]? {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Travel Log"
    }
    
    var managedObjectContext: NSManagedObjectContext? {
        return ((UIApplication.sharedApplication().delegate) as? AppDelegate)?.managedObjectContext
    }
    
    //fetching core data to load into cells
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
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        }
        return cell
    }
    
    //unwinding from NewTripPickerVC
    @IBAction func saveNewTrip(unwindsegue: UIStoryboardSegue) {
    }
    
    private func calculateCellSize() {
        let tempImage = UIImage(named: "photoNotAvailable")
        let scaleFactor = tableView!.frame.width/2.5/tempImage!.size.width
        var tempSize = CGSize(width: tempImage!.size.width*scaleFactor, height: tempImage!.size.height*scaleFactor)
        tempSize.height += tempSize.width/3.5
        cellSize = tempSize
    }
}
