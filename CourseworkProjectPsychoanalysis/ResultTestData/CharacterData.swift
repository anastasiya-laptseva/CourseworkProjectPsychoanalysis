//
//  CharacterData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class CharacterData: BaseData, TestsDataProtocol {
    let keySave = "result_character"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Character test"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "")"
    }
    
    func getLongDescription() -> String {
        return getResultLong(value: result ?? "")
    }

    func getResultLong(value: String) -> String  {
        let tests = JSONManager().loadTest()
        let characterResultModel = tests.characterTest.results
        switch result {
        case "1111":
            return  characterResultModel.r1111
        case "1000":
            return characterResultModel.r1000
        case "1001":
            return characterResultModel.r1001
        case "1011":
            return characterResultModel.r1011
        case "0111":
            return characterResultModel.r0111
        case "0110":
            return characterResultModel.r0110
        case "0100":
            return characterResultModel.r0100
        case "0000":
            return characterResultModel.r0000
        case "1010":
            return characterResultModel.r1010
        case "1110":
            return characterResultModel.r1110
        case "1100":
            return characterResultModel.r1100
        case "0001":
            return characterResultModel.r0001
        case "0011":
            return characterResultModel.r0011
        case "0101":
            return characterResultModel.r0101
        case "1101":
            return characterResultModel.r1101
        case "0010":
            return characterResultModel.r0010
        default:
            return ""
        }
    }
}
