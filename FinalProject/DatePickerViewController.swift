//
//  DatePickerViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/19/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    var newTripViewController: UIViewController? = nil

    @IBAction func doneButton(sender: UIBarButtonItem) {
        if newTripViewController != nil {
          //  newTripViewController.departDateLabel = datePicker
        }
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
