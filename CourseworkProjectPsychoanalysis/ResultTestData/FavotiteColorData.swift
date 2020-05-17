//
//  FavotiteColorData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class FavotiteColorData: BaseData, TestsDataProtocol {
    let keySave = "result_favorite_color"
    
    override func getKey() -> String {
        return keySave
    }
    
    func getName() -> String {
        return "Favorite color Test"
    }
    
    func getShortDescription() -> String {
        return "\(result ?? "")"
    }
    
    func getLongDescription() -> String {
        return getResultLong(value: result ?? "")
    }
    
    func getResultLong(value: String) -> String  {
        let tests = JSONManager().loadTest()
        let favoriteColorResultModel = tests.favoriteColorTest.results
        switch result {
        case "white":
            return  favoriteColorResultModel.white
        case "black":
            return favoriteColorResultModel.black
        case "gray":
            return favoriteColorResultModel.gray
        case "red":
            return favoriteColorResultModel.red
        case "orange":
            return favoriteColorResultModel.orange
        case "brown":
            return  favoriteColorResultModel.brown
        case "yellow":
            return favoriteColorResultModel.yellow
        case "pink":
            return favoriteColorResultModel.pink
        case "blue":
            return favoriteColorResultModel.blue
        case "green":
            return favoriteColorResultModel.green
        default:
            return ""
        }
    }
}
