//
//  State+CoreDataProperties.swift
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

extension State {

    @NSManaged var population: NSNumber?
    @NSManaged var stateText: String?
    @NSManaged var cities: NSSet?

}
