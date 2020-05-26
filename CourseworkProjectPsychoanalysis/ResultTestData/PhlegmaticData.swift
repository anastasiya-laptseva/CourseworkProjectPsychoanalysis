//
//  PhlegmaticData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class PhlegmaticData: BaseData, TestsDataProtocol {
    let keySave = "result_phlegmatic"
    func getImage() -> UIImage {
        return UIImage(named: "phlegmatic") ?? UIImage()
    }
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
        let tests = JSONManager().loadTest()
        return tests.temperamentTest.results.phlegmatic
    }
}
