//
//  Trip+CoreDataProperties.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/18/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData


extension Trip {

    @NSManaged var destination: String?
    @NSManaged var departureDate: NSDate?
    @NSManaged var returnDate: NSDate?
    @NSManaged var image: NSData?

}
