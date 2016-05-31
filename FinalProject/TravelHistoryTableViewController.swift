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
    
//    //Allowing User to filter through tweets using a key word
//    var searchText: String? {
//        didSet {
//            searchTextField?.text = searchText
//            title = searchText
//        }
//    }
//    
//    @IBOutlet weak var searchTextField: UITextField! {
//        didSet{
//            searchTextField.delegate = self
//            searchTextField.text = searchText
//        }
//    }
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        searchText = textField.text
//        return true
//    }
    
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
}
