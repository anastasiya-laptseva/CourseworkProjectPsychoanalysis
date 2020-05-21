//
//  ButtonsTestQuestionsViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class DifficultyTestQuestionsViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    let resultIdentifier = "resultDifficalty"
    var currentNumber: Int = -1
    var sum: Int = 0
    
    var countQuestion = 0
    var difficultyModel: DifficultyEntity?
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explanationLabel.text = difficultyModel?.explanation
        UpdateQuestion()
    }
    
    @IBAction func neverButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.never
    }
    @IBAction func extremelyRarelyButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.extremelyRarely
    }
    @IBAction func rarelyButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.rarely
    }
    @IBAction func sometimesButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.sometimes
    }
    @IBAction func oftenButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.often
    }
    @IBAction func almostAlwaysButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.almostAlways
    }
    @IBAction func alwaysButton(_ sender: Any) {
        UpdateQuestion()
        sum = sum + difficultyModel!.answers.always
    }
    
    func UpdateQuestion() {
        currentNumber += 1
        let questions = difficultyModel?.questions
        if currentNumber < questions?.count ?? 0 {
            questionLabel.text = questions?[currentNumber].question
            progressLabel.text = "\(currentNumber+1)/\(questions?.count ?? 0)"
        } else {
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        }
    }
    
    func resultSum(value: Int) -> String {
        if sum <= 30 {
            DifficultyData().save(value: "result1")
            return difficultyModel!.results.result1
        } else if sum>30 && sum<=50 {
            DifficultyData().save(value: "result2")
            return difficultyModel!.results.result2
        } else if sum>50 && sum<=90{
            DifficultyData().save(value: "result3")
            return difficultyModel!.results.result3
        } else {
            DifficultyData().save(value: "result4")
            return difficultyModel!.results.result4
        }
        
        
    }
//создать функцию которая принимает параметром int число и возвращает string, где String это результат реста на основе алгоритма. Функция должна анализировать входной параметр Int
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultIdentifier {
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            
            resultController.setNameResult(value: "Difficulty Test")
            resultController.setTextResult(value: resultSum(value: sum))
        }
    }
}
