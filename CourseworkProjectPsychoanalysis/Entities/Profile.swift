//
//  Profile.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct Profile: Codable {
    var imagePath: Data?
    var name: String
    var age: Int
    var gender: Int
    var info: String
}
