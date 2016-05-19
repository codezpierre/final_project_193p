//
//  MajorCitiesTableViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class MajorCitiesTableViewController: UITableViewController {

    var cities = [] {
        didSet {
            tableView.reloadData() // reload everytime something is added
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // all cells will be estimated to be the height in the storyboard
        tableView.estimatedRowHeight = tableView.rowHeight
        // but let autolayout pick the height of cells that become visible
        tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationItem.title = "Travel the US"
        
    }
    
    
//    @IBOutlet weak var searchTextField: UITextField! {
//        didSet{
//            searchTextField.delegate = self
//            searchTextField.text = searchText
//        }
//    }

//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        searchText = textField.text
//        return true
//    }

//    var searchText: String? {
//        didSet {
//            searchTextField?.text = searchText
//            tweets.removeAll()
//            lastTwitterRequest = nil
//            searchForTweets()
//            title = searchText
//            addtoSaved(searchText!)
//        }
//    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //cities.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1 //cities[section].count
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let destinationVC = segue.destinationViewController
//        if let menuVC = destinationVC as? MenuViewController {
//            if let identifier = segue.identifier,
//                let mcvc = sender as? MajorCitiesTableViewCell
//                where identifier == "showMenu" {
//                //menuVC.city = "Boulder" //THIS WILL NEED TO BE UPDATED
//            }
//        }
//    }
    

}
