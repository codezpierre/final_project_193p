//
//  MajorCitiesTableViewCell.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class MajorCitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var MajorCityLabel: UILabel!
    
    @IBOutlet weak var StateLabel: UILabel!
    
    private func updateUI() {
        
        //this is just a place holder until we get core data going
        MajorCityLabel?.text = "Boulder"
        StateLabel?.text = "Colorado"
    }

}
