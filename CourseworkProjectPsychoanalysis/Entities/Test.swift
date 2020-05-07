//
//  Test.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/8/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

public struct Test : Codable {
    var array : [ObjectArray]
    var boolean: Bool
    var color: String
    var number: Int
    var object: ArrayObject
    var string: String
}

public struct ObjectArray : Codable {
    var boolean: Bool
    var color: String
}

public struct ArrayObject : Codable {
    var a: String
    var c: String
}
