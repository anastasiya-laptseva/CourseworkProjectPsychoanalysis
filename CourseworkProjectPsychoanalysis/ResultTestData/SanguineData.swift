//
//  SanguineData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class SanguineData: BaseData, TestsDataProtocol {
    let keySave = "result_sanguine"
    func getImage() -> UIImage {
        return UIImage(named: "sanguine") ?? UIImage()
    }
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
        let tests = JSONManager().loadTest()
        return tests.temperamentTest.results.sanguine
    }
}
