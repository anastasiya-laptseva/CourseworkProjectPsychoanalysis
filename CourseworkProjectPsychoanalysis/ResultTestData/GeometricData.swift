//
//  GeometricData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class GeometricData: BaseData, TestsDataProtocol {
    let keySave = "result_geometric"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Geometric test"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "")"
    }
    
    func getLongDescription() -> String {
        return getResultLong(value: result ?? "")
    }
    
    func getResultLong(value: String) -> String  {
        let tests = JSONManager().loadTest()
        let geometricResultModel = tests.geometricTest.results
        switch result {
        case "square":
            return  geometricResultModel.square
        case "triangle":
            return geometricResultModel.triangle
        case "rectangle":
            return geometricResultModel.rectangle
        case "circle":
            return geometricResultModel.circle
        case "zigzag":
            return geometricResultModel.zigzag
        default:
            return ""
        }
    }
}
