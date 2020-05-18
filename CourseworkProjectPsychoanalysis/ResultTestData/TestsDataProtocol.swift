//
//  TestsProtocol.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/16/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

protocol TestsDataProtocol {
    func getName() -> String
    func getImage() -> UIImage
    func getShortDescription() -> String
    func getLongDescription() -> String
}
