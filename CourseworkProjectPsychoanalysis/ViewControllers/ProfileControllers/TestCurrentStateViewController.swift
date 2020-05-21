//
//  TestCurrentStateViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/19/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class TestCurrentStateViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question2Label: UILabel!
    
    let resultIdentifier = "resultCurrentState"
    var currentNumber: Int = -1
    var sum: Int = 0
    var countQuestion = 0
    var currentStateModel: CurrentStateEntity?
    var result: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answersSegmentedControl(_ sender: Any) {
        UpdateQuestion()
        sum = sum + currentStateModel!.answers.negative1
        sum = sum + currentStateModel!.answers.negative2
        sum = sum + currentStateModel!.answers.negative3
        sum = sum + currentStateModel!.answers.neutral0
        sum = sum + currentStateModel!.answers.positive1
        sum = sum + currentStateModel!.answers.positive2
        sum = sum + currentStateModel!.answers.positive3
    }
    
    @IBAction func NextButton(_ sender: Any) {
    }
    
    func UpdateQuestion() {
        currentNumber += 1
        let questions = currentStateModel?.questions
        if currentNumber < questions?.count ?? 0 {
            question1Label.text = questions?[currentNumber].question1
            question2Label.text = questions?[currentNumber].question2
            progressLabel.text = "\(currentNumber+1)/\(questions?.count ?? 0)"
        } else {
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        }
    }
    
    func resultSum(value: Int) -> String {
        if sum <= 30 {
            DifficultyData().save(value: "result1")
            return currentStateModel!.results.result1
        } else if sum>30 && sum<=50 {
            DifficultyData().save(value: "result2")
            return currentStateModel!.results.result2
        } else {
            DifficultyData().save(value: "result3")
            return currentStateModel!.results.result3
        }
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
