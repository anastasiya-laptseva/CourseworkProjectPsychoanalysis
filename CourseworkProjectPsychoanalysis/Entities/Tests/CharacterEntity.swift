//
//  CharacterEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

//character Type structures
public struct CharacterType : Codable {
    var introvert : [QuestionsArray]
    var extrovert : [QuestionsArray]
    var results: CharacterTypeResult
}
