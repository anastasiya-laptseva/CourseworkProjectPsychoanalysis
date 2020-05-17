//
//  ResultCollectionViewCell.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/17/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    
    func setCell(text: String, color: UIColor) {
        self.backgroundColor = color
        label.text = text
        label.textColor = .white
    }
}
