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
    //var departureDate
    
    
    //    @IBAction func doneButton(sender: UIBarButtonItem) {
    //        if newTripViewController != nil {
    //            if isDeparture == true {
    //                newTripViewController!.departDateLabel.text = "\(datePicker.date)"
    //            } else {
    //                newTripViewController!.returnDateLabel.text = "\(datePicker.date)"
    //            }
    //        }
    //       // dismissViewControllerAnimated(true, completion: nil)
    //    }
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController
        let id =  segue.identifier
        if id == "unwindFromDateDone" {
            if let newTripVC = destinationVC as? NewTripViewController {
                if isDeparture{
                    newTripVC.savedDepartDate = datePicker.date
                } else {
                    newTripVC.savedReturnDate = datePicker.date
                }
                
            }
        }
    }
}


