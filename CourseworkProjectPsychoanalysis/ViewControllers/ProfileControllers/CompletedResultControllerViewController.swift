//
//  CompletedResultControllerViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/17/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class CompletedResultControllerViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var nameText: String?
    var desriptionText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameText
        descriptionLabel.text = desriptionText
    }
    func setData(name: String, description: String) {
        nameText = name
        desriptionText = description
    }
}
