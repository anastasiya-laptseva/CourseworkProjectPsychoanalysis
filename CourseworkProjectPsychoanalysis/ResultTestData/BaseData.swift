//
//  BaseData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class BaseData {
    var result: String?
    open func getKey() -> String {
        ""
    }
    func load() {
        result = TestsCoreData.shared.getWithKey(key: getKey())
            //SaveManager.shared.loadWithKey(key: getKey())
    }
    func save(value: String) {
        TestsCoreData.shared.editWithKey(key: getKey(), value: value)
        //SaveManager.shared.saveWithKey(key: getKey(), value: value)
    }
    func isResult() -> Bool {
        return result?.elementsEqual("") == false
    }
}
