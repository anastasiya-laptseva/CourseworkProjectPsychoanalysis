//
//  CholericData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class CholericData: BaseData, TestsDataProtocol {
    let keySave = "result_choleric"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Choleric"
    }
    
    func getShortDescription() -> String {
        return "\(result) %"
    }
    
    func getLongDescription() -> String {
        var tests = JSONManager().loadTest()
        return tests.temperamentTest.results.choleric
    }

}
