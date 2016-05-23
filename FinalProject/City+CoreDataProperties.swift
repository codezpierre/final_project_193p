//
//  City+CoreDataProperties.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension City {

    @NSManaged var isCapital: NSNumber?
    @NSManaged var visited: NSNumber?
    @NSManaged var cityText: String?
    @NSManaged var state: State?
    @NSManaged var trips: NSSet?

}
