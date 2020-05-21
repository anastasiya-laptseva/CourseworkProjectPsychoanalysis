//
//  ResultCollectionViewCell.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/17/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    
    func setCell(name: String, description: String, image: UIImage) {
        labelName.text = name
        labelDescription.text = description
        imageIcon.image = image
    }
}
