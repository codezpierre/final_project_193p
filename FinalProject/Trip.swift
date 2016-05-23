//
//  Trip.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Trip: NSManagedObject {
    
    static var context = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    func save() {
        do {
            try Trip.context!.save()
        } catch {
            print(error)
        }
    }
    
    class func createTrip(destination: String, departureDate: NSDate, returnDate: NSDate, image: NSData) -> Trip? {
        if let trip = NSEntityDescription.insertNewObjectForEntityForName("Trip", inManagedObjectContext: context!) as? Trip {
            //trip.destination = destination
            trip.departureDate = departureDate
            trip.returnDate = returnDate
            trip.image = image
            
            trip.save()
            return trip
        }
        return nil
    }
    
}
