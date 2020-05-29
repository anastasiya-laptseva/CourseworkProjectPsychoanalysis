//
//  TestCurrentStateViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/19/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class TestCurrentStateViewController: UIViewController {
//    outlets
    @IBOutlet weak var scroliView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question2Label: UILabel!
//    variables
    let resultIdentifier = "stateResult"
    var currentNumber: Int = -1
    var sum: Int = 0
    var countQuestion = 0
    var currentStateModel: CurrentStateEntity?
    var result: String?
    var array = [Int]()
    var selectedIndex: Int = 0
    var healthArray = [0, 1, 6, 7, 12, 13, 18, 19, 24, 25]
    var activityArray = [2, 3, 8, 9, 14, 15, 20, 21, 26, 27]
    var moodArray = [4, 5, 10, 11, 16, 17, 22, 23, 28, 29]
//    view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scroliView, stackView])
        currentStateModel = JSONManager().loadTest().currentStateTest
        if let questions = currentStateModel?.questions {
            for _ in 0...questions.count {
                array.append(0)
            }
        }
        updateQuestion()
    }
    @IBAction func answersSegmentedControl(_ sender: Any) {
        if let segment = sender as? UISegmentedControl {
            selectedIndex = segment.selectedSegmentIndex
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        let questions = currentStateModel?.questions ?? [Questions]()
        array[currentNumber] = currentStateModel?.answers[selectedIndex] ?? 0
        if currentNumber == questions.count-1 {
            calculate()
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        } else { updateQuestion() }
    }
    func updateQuestion() {
        currentNumber += 1
        let questions = currentStateModel?.questions
        if currentNumber < questions?.count ?? 0 {
            question1Label.text = questions?[currentNumber].question1
            question2Label.text = questions?[currentNumber].question2
            progressLabel.text = "\(currentNumber+1)/\(questions?.count ?? 0)"
        }
    }
    func calculate() {
        var sumHealth = 0
        var sumActivity = 0
        var sumMood = 0
        for index in 0...array.count-1 {
            let value = array[index]
            if healthArray.contains(index) {
                sumHealth+=value
            } else if activityArray.contains(index) {
                sumActivity+=value
            } else {
                sumMood+=value
            }
        }
        let data = CurrentStateData()
        data.set(key: .currentStateHealth, value: sumHealth)
        data.set(key: .currentStateActivity, value: sumActivity)
        data.set(key: .currentStateMood, value: sumMood)
    }
}
