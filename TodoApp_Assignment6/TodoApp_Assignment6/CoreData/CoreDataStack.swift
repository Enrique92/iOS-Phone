//
//  CoreDataStack.swift
//  TodoApp_Assignment6
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error \(error)")
                return
            }
        }
        return container
    }
    
    var managerContext: NSManagedObjectContext {
        return container.viewContext
    }
    
}
