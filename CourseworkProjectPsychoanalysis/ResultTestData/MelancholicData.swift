//
//  MelancholicData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class MelancholicData: BaseData, TestsDataProtocol {
    let keySave = "result_melancholic"
    func getImage() -> UIImage {
        return UIImage(named: "melancholic") ?? UIImage()
    }
    override func getKey() -> String {
        return keySave
    }
    func getName() -> String {
        return "Melancholic"
    }
    func getShortDescription() -> String {
        return "\(result ?? "0.0") %"
    }
    func getLongDescription() -> String {
        let tests = JSONManager().loadTest()
        return tests.temperamentTest.results.melancholic
    }
}
