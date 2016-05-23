//
//  City.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import Foundation
import CoreData


class City: NSManagedObject {
    
    class func addCity(cityText: String, context: NSManagedObjectContext) -> City?
    {
        //first we will look for a city matching the current city
        //if it exists, return this city
        //else, add it to core data 
        let request = NSFetchRequest(entityName: "City")
        request.predicate = NSPredicate(format: "cityText = %@", cityText)
        if let city = (try? context.executeFetchRequest(request))?.first as? City {
            return city
        } else if let city = NSEntityDescription.insertNewObjectForEntityForName("City", inManagedObjectContext: context) as? City {
            city.cityText = cityText
            return city
        }
        return nil
    }
}
