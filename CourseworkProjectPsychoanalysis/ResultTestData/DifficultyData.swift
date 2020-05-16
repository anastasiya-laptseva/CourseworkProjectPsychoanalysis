//
//  DifficultyData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class DifficultyData: BaseData, TestsDataProtocol {
    let keySave = "result_difficalty"
    
    override func getKey() -> String {
        return keySave
    }

    
    func getName() -> String {
        return "Difficalty test"
    }
    
    func getShortDescription() -> String {
        return ""
    }
    
    func getLongDescription() -> String {
        return getResultLong(value: result ?? "")
    }
    func getResultLong(value: String) -> String  {
        let tests = JSONManager().loadTest()
        let difficaltyResultModel = tests.difficultyTest.results
        switch result {
        case "result1":
            return  difficaltyResultModel.result1
        case "result2":
            return difficaltyResultModel.result2
        case "result3":
            return difficaltyResultModel.result3
        case "result4":
            return difficaltyResultModel.result4
        default:
            return ""
        }
    }

}
