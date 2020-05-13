//
//  FavoriteColorEntity.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/13/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

//favorite color structures
public struct FavoriteColorEntity : Codable {
    var question : String
    var results: FavotiteColorResult
}
