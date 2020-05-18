//
//  SanguineData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class SanguineData: BaseData, TestsDataProtocol {
    
    func getImage() -> UIImage {
        return UIImage(named: "sanguine") ?? UIImage()
    }
    
    let keySave = "result_sanguine"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Sanguine"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "0.0") %"
    }
    
    func getLongDescription() -> String {
        var tests = JSONManager().loadTest()
        return tests.temperamentTest.results.sanguine
    }

}
