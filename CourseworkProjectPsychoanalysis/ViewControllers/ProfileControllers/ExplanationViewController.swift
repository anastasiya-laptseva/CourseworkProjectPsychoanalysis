//
//  ExplanationViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/28/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ExplanationViewController: UIViewController {
//    outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var goButton: BorderButton!
//    view did load
    override func viewDidLoad() {
        AnimationManager.shared.animationTextWithSymbol(label: textLabel,
                                                        newText: textLabel.text!,
                                                        characterDelay: 0.001)
        AnimationManager.shared.animationFromFade(view: goButton, duration: 0.0, delay: 0.5)
    }
}
