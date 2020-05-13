//
//  TestQuestionsViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class YesNoTestQuestionsViewController: UIViewController {
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var currentNumber: Int = -1
    let resultIdentifier = "result"
    
    
    var testName: String?
    var testDescription: String?
    var questions: [QuestionsArray]?
    var countQuestion = 0
    var result = [Bool]()
    var resultPersent: Float?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous question", style: .plain, target: self, action: #selector(backQuestion))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close Test", style: .plain, target: self, action: #selector(closeTest))
        
        countQuestion = questions?.count ?? 0
        for _ in 0...countQuestion {
            result.append(false)
        }
        
        UpdateQuestion()
    }
    
    @objc func backQuestion() {
        print("backQuestion")
    }
    @objc func closeTest() {
        print("closeTest")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesClick(_ sender: Any) {
        result[currentNumber] = true
        UpdateQuestion()
    }
    
    @IBAction func noClick(_ sender: Any) {
        result[currentNumber] = false
        UpdateQuestion()
    }
    
    func UpdateQuestion() {
        currentNumber += 1
        if(currentNumber < questions?.count ?? 0){
            questionLabel.text = questions?[currentNumber].question
            progressLabel.text = "\(currentNumber+1)/\(questions?.count ?? 0)"
        }
        else{
            var countYes = 0
            for value in result {
                if value == true{
                    countYes+=1
                }
            }
            resultPersent = Float(countYes)/Float(countQuestion)*100
            
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        }
    }

    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultIdentifier{
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            resultController.setNameResult(value: "\(testName ?? "") - \(resultPersent ?? 0.0)%")
            resultController.setTextResult(value: "\(testDescription ?? "")")
        }
    }
}
