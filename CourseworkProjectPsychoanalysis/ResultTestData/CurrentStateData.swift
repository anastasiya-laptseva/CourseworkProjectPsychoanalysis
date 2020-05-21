//
//  CurrentStateData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/20/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

class CurrentStateData: BaseData, CurrentStateProtocol {
    
    let keySave = "result_current_state"
    
    override func getKey() -> String {
        return keySave
    }

    
    func getName() -> String {
        return "Current state"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "")"
    }
    
    func getLongDescription() -> String {
        return getResultLong(value: result ?? "")
    }
    func getResultLong(value: String) -> String  {
        let tests = JSONManager().loadTest()
        let currentStateModel = tests.currentStateTest.results
        switch result {
        case "result1":
            return  currentStateModel.result1
        case "result2":
            return currentStateModel.result2
        case "result3":
            return currentStateModel.result3
        default:
            return ""
        }
    }

}
