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
        result = SaveManager.shared.loadWithKey(key: getKey())
    }
    func save(value: String) {
        SaveManager.shared.saveWithKey(key: getKey(), value: value)
    }
    func isResult() -> Bool {
        return result?.elementsEqual("") == false
    }
}
