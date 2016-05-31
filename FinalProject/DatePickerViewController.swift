//
//  DatePickerViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/19/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    var newTripViewController: NewTripViewController? = nil
    var isDeparture = true
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pick a Date"

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController
        let id =  segue.identifier
        if id == "unwindFromDateDone" { //clicking done triggers unwind segue
            if let newTripVC = destinationVC as? NewTripViewController {
                //saves the selected Date to updateUI later
                if isDeparture{
                    newTripVC.savedDepartDate = datePicker.date
                } else {
                    newTripVC.savedReturnDate = datePicker.date
                }
                
            }
        }
    }
}


