//
//  TemperamentTest.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/8/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct Tests: Codable{
    var test1: Temperaments
    var test2: Temperaments
    var test3: Temperaments
}

public struct Temperaments : Codable {
    var phlegmatic : [QuestionsArray]
    var melancholic : [QuestionsArray]
    var choleric : [QuestionsArray]
    var sanguine : [QuestionsArray]
    var results: ResultArray
}

public struct QuestionsArray : Codable {
    var question: String
}

public struct ResultArray : Codable {
    var phlegmatic: String
    var melancholic: String
    var choleric: String
    var sanguine: String
}

