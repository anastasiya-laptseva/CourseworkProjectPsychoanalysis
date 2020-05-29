//
//  TemperamentEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

//Temperament structures
public struct TemperamentEntity: Codable {
    var phlegmatic: [QuestionsArray]
    var melancholic: [QuestionsArray]
    var choleric: [QuestionsArray]
    var sanguine: [QuestionsArray]
    var results: ResultArray
}
