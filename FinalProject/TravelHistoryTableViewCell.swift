//
//  TravelHistoryTableViewCell.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class TravelHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var departDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!

    var trip: Trip? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        // reset any existing tweet information (clear out outlets)
        destinationLabel?.text = nil
        tripImageView?.image = nil
        departDateLabel?.text = "Depart Date"
        returnDateLabel?.text = "Return Date"
        
        if let trip = self.trip
        {
            //set cell data
            if let imageData = trip.image {
                tripImageView?.image = UIImage(data: imageData)
            }
            
            destinationLabel?.text = trip.destination?.cityText ?? "Destination"            
            returnDateLabel?.text = String(trip.returnDate) ?? "Return Date"
            
            
            let formatter_depart = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(trip.departureDate!) > 24*60*60 {
                formatter_depart.dateStyle = NSDateFormatterStyle.ShortStyle
            } else {
                formatter_depart.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            departDateLabel?.text = formatter_depart.stringFromDate(trip.departureDate!) ?? "Depart Date"
            
            //formatting NSDate to be readable
            let formatter_return = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(trip.returnDate!) > 24*60*60 {
                formatter_return.dateStyle = NSDateFormatterStyle.ShortStyle
            } else {
                formatter_return.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            returnDateLabel?.text = formatter_return.stringFromDate(trip.returnDate!) ?? "Return Date"
        }
    }
}

