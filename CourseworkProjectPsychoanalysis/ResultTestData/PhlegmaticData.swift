//
//  PhlegmaticData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class PhlegmaticData: BaseData, TestsDataProtocol {
    func getImage() -> UIImage {
        return UIImage(named: "phlegmatic") ?? UIImage()
    }
    
    let keySave = "result_phlegmatic"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Phlegmatic"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "0.0") %"
    }
    
    func getLongDescription() -> String {
        var tests = JSONManager().loadTest()
        return tests.temperamentTest.results.phlegmatic
    }
}
