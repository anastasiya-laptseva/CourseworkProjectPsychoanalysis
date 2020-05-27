//
//  ProfileCoreData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/28/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit
import CoreData

class ProfileCoreData: NSObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Storage")
        container.loadPersistentStores { description, error in
            if let error = error {
                // Add your error UI here
            }
        }
        return container
    }()
    
    
    func saveName(name: String) {
        let managedContext = persistentContainer.viewContext
        let entity =
          NSEntityDescription.entity(forEntityName: "Profile",
                                     in: managedContext)!
        
        let person = NSManagedObject(entity: <#T##NSEntityDescription#>, insertInto: <#T##NSManagedObjectContext?#>)
            //NSManagedObject(entity: entity,
                                   //  insertInto: managedContext)
        person.setValue(name, forKeyPath: "name")
        do {
            try managedContext.save()
            //save to table
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
