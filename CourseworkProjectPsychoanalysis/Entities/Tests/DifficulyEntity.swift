//
//  DifficulyEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/13/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct DifficultyEntity: Codable {
    var explanation: String
    var questions: [QuestionsArray]
    var answers: AnswersArray
    var results: DifficultyResultArray
}
public struct AnswersArray: Codable {
    var never: Int
    var extremelyRarely: Int
    var rarely: Int
    var sometimes: Int
    var often: Int
    var almostAlways: Int
    var always: Int
}
