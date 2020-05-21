//
//  CurrentStateEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/20/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct CurrentStateEntity : Codable {
    var questions : [Questions]
    var answers : Answers
    var results: CurrentStateResult
}

public struct Questions : Codable {
    var question1: String
    var question2: String
}

public struct Answers : Codable {
    var negative3: Int
    var negative2: Int
    var negative1: Int
    var neutral0: Int
    var positive1: Int
    var positive2: Int
    var positive3: Int
}


