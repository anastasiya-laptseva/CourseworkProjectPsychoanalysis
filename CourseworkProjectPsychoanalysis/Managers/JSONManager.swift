//
//  JSONManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/8/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class JSONManager {
    func loadFileAsString(name: String, type: String) -> Data {
        if let path = Bundle.main.path(forResource: name, ofType: type) {
            let fileManager = FileManager()
            let exists = fileManager.fileExists(atPath: path)
            if exists {
                return fileManager.contents(atPath: path) ?? Data.init()
            }
        }
        return Data.init()
    }
    func loadTest() -> TestsEntity {
        var nameJson = ""
        let preferredLanguage = NSLocale.preferredLanguages.first
        switch preferredLanguage {
        case "ru-US":
            nameJson = "AllTestsRU"
        default:
            nameJson = "AllTestsEN"
        }
        let dataJson = loadFileAsString(name: nameJson, type: ".json")
        let testModel: TestsEntity = try! JSONDecoder().decode(TestsEntity.self, from: dataJson)
        return testModel
    }
}
