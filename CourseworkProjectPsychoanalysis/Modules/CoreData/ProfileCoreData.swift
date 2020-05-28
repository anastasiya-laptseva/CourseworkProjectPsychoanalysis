//
//  ProfileCoreData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/28/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit
import CoreData

class TestsData {
    static let shared = TestsData()
    private init() {}
    let xcdatamodelId = "Storage"
    let profileTableName = "ProfileTable"
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: xcdatamodelId)
        container.loadPersistentStores { _, error in
            if let error = error {
                // Add your error UI here
            }
        }
        return container
    }()
    func editWithKey(key: String, value: String) {
        let context = persistentContainer.viewContext
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: profileTableName, in: context)
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        do {
            var result = try context.fetch(fetchRequest)
            if result.count == 0 {
                result.append(value)
            } else {
                if let nameField = result[0] as? NSManagedObject {
                    nameField.setValue(value, forKey: key)
                }
            }
            saveContext()
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    func getWithKey(key: String) -> String {
        let context = persistentContainer.viewContext
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: profileTableName, in: context)
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        do {
            let result = try context.fetch(fetchRequest)
            if result.count > 0 {
                if let nameField = result[0] as? NSManagedObject {
                    if let value = nameField.value(forKey: key) as? String {
                        return value
                    }
                }
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return ""
    }
    func saveContext() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
    }
}
