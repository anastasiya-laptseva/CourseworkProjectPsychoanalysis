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
    func getImage() -> UIImage {
        return UIImage(named: "choleric") ?? UIImage()
    }
    override func getKey() -> String {
        return keySave
    }
    func getName() -> String {
        return "Choleric"
    }
    func getShortDescription() -> String {
        return "\(result ?? "0.0") %"
    }
    func getLongDescription() -> String {
        let tests = JSONManager().loadTest()
        return tests.temperamentTest.results.choleric
    }
}
