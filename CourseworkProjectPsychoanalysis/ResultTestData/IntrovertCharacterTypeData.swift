//
//  IntrovertCharacterTypeData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class IntrovertCharacterTypeData: BaseData, TestsDataProtocol {
    let keySave = "result_introvert"
    
    func getImage() -> UIImage {
        return UIImage(named: "introvert") ?? UIImage()
    }
    
    override func getKey() -> String {
        return keySave
    }

    func getName() -> String {
        return "Introvert"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "0.0") %"
    }
    
    func getLongDescription() -> String {
        var tests = JSONManager().loadTest()
        return tests.characterTypeTest.results.introvert
    }

}
