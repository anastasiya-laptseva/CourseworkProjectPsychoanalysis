//
//  LocalizationManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/21/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

class LocalizationManager {
    static let shared = LocalizationManager()
    private init(){}
    
    static let KEY_SAVE = "keySave";
    
    func getText(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
