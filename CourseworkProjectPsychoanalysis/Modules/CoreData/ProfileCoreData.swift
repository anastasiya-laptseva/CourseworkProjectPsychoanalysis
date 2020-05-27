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
    
}
