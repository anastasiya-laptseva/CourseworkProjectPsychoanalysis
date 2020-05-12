//
//  TemperamentTest.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/8/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct Tests: Codable {
    var temperamentTest: [Temperaments]
    var characterTypeTest: Temperaments
    var characterTest: Temperaments
    var favoriteColorTest: Temperaments
    var geometricTest: Temperaments
    var difficultyTest: Temperaments
}

//Temperament structures
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

//character Type structures
public struct CharacterType : Codable {
    var introvert : [CharacterTypeQuestionsArray]
    var extrovert : [CharacterTypeQuestionsArray]
    var results: ResultArray
}

public struct CharacterTypeQuestions : Codable {
    var question: String
}

public struct CharacterTypeResult : Codable {
    var introvert: String
    var extrovert: String
}
