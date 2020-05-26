//
//  BorderButton.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/26/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
