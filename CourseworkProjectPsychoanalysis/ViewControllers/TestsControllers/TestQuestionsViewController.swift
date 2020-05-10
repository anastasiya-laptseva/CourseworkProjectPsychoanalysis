//
//  TestQuestionsViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class TestQuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous question", style: .plain, target: self, action: #selector(backQuestion))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close Test", style: .plain, target: self, action: #selector(closeTest))
    }
    
    @objc func backQuestion() {
        print("backQuestion")
    }
    @objc func closeTest() {
        print("closeTest")
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
