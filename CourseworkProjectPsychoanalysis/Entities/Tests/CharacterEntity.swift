//
//  CharacterEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/13/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

//Character structures
public struct CharacterEntity: Codable {
    var questions: [QuestionsArray]
    var results: CharacterResult
}
