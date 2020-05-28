//
//  CurrentStateEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/20/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct CurrentStateEntity: Codable {
    var questions: [Questions]
    var answers: [Int]
    var results: CurrentStateResult
}
public struct Questions: Codable {
    var question1: String
    var question2: String
}
