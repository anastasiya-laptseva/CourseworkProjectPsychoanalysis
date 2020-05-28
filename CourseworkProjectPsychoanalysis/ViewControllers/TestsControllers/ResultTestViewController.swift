//
//  ResultTest.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ResultTestViewController: UIViewController {
    @IBOutlet weak var nameResultLabel: UILabel!
    @IBOutlet weak var textResultLabel: UILabel!
//    variables
    var testName: String?
    var testDescription: String?
// view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        nameResultLabel.text = testName
        textResultLabel.text = testDescription
        // Do any additional setup after loading the view.
    }
    func setNameResult(value: String) {
        testName = value
    }
    func setTextResult(value: String) {
        testDescription = value
    }
    @IBAction func clickBack(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: AllTestsTableViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
