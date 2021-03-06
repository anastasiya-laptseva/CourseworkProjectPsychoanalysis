//
//  ButtonsTestQuestionsViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class DifficultyTestQuestionsViewController: UIViewController {
// outlets
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
// variables
    let resultIdentifier = "resultDifficalty"
    var currentNumber: Int = -1
    var sum: Int = 0
    var countQuestion = 0
    var difficultyModel: DifficultyEntity?
    var result: String?
// view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        explanationLabel.text = difficultyModel?.explanation
        updateQuestion()
    }
//    answers buttons
    @IBAction func neverButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.never
    }
    @IBAction func extremelyRarelyButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.extremelyRarely
    }
    @IBAction func rarelyButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.rarely
    }
    @IBAction func sometimesButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.sometimes
    }
    @IBAction func oftenButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.often
    }
    @IBAction func almostAlwaysButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.almostAlways
    }
    @IBAction func alwaysButton(_ sender: Any) {
        updateQuestion()
        sum += difficultyModel!.answers.always
    }
//    functions
    func updateQuestion() {
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
        } else if sum>50 && sum<=90 {
            DifficultyData().save(value: "result3")
            return difficultyModel!.results.result3
        } else {
            DifficultyData().save(value: "result4")
            return difficultyModel!.results.result4
        }
    }
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
