//
//  State.swift
//  FinalProject
//
//  Created by robbes on 5/22/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import Foundation
import CoreData


class State: NSManagedObject {
    
    class func addState (stateText: String, context: NSManagedObjectContext) -> State?
    {
        let request = NSFetchRequest(entityName: "State")
        request.predicate = NSPredicate(format: "stateText = %@", stateText)
        if let state = (try? context.executeFetchRequest(request))?.first as? State {
            return state
        } else if let state = NSEntityDescription.insertNewObjectForEntityForName("State", inManagedObjectContext: context) as? State {
            state.stateText = stateText
            return state
        }
        return nil
    }
    

}
