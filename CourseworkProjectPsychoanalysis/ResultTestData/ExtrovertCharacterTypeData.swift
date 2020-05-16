//
//  ExtrovertCharacterTypeData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ExtrovertCharacterTypeData: BaseData, TestsDataProtocol {
    let keySave = "result_extrovert"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Extrovert"
    }
    
    func getShortDescription() -> String {
        return "\(result) %"
    }
    
    func getLongDescription() -> String {
        var tests = JSONManager().loadTest()
        return tests.characterTypeTest.results.extrovert
    }

}
