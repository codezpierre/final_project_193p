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
        departDateLabel?.text = nil
        returnDateLabel?.text = nil
        
        // load new information from our tweet (if any)
        if let trip = self.trip
        {
//            if let imageData = trip.image {
//                tripImageView?.image = UIImageView(data: imageData!)
//            }
            
            destinationLabel?.text = trip.destination
            returnDateLabel?.text = String(trip.returnDate)
//            
//            if let imageData = trip.image {
//                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { [ weak weakSelf = self ] in
//                    if let imageData = NSData(contentsOfURL: imageUrl) {
//                        if imageUrl == weakSelf?.tweet!.user.profileImageURL {
//                            dispatch_async(dispatch_get_main_queue()) {
//                                weakSelf?.tweetProfileImageView?.image = UIImage(data: imageData)
//                            }
//                        }
//                    }
//                }
//            }
//            
            
            
            let formatter_depart = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(trip.departureDate!) > 24*60*60 {
                formatter_depart.dateStyle = NSDateFormatterStyle.ShortStyle
            } else {
                formatter_depart.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            departDateLabel?.text = formatter_depart.stringFromDate(trip.departureDate!)
            
            let formatter_return = NSDateFormatter()
            if NSDate().timeIntervalSinceDate(trip.returnDate!) > 24*60*60 {
                formatter_return.dateStyle = NSDateFormatterStyle.ShortStyle
            } else {
                formatter_return.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            returnDateLabel?.text = formatter_return.stringFromDate(trip.returnDate!)
        }
    }
}

