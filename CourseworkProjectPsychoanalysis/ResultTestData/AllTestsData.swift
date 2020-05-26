//
//  AllTestsData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AllTestsData {
    private var allTests: [TestsDataProtocol]?
    var loadTests = [TestsDataProtocol]()
    init() {
        allTests = [TestsDataProtocol]()
        allTests?.append(PhlegmaticData())
        allTests?.append(MelancholicData())
        allTests?.append(CholericData())
        allTests?.append(SanguineData())
        allTests?.append(ExtrovertCharacterTypeData())
        allTests?.append(IntrovertCharacterTypeData())
        allTests?.append(CharacterData())
        allTests?.append(DifficultyData())
        allTests?.append(GeometricData())
        allTests?.append(FavotiteColorData())
    }
    func load() {
        let data = allTests as! [BaseData]
        loadTests.removeAll()
        for test in data {
            test.load()
            if test.isResult(){
                loadTests.append(test as! TestsDataProtocol)
            }
        }
    }
}
