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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
// variables
    var currentNumber: Int = -1
    let resultIdentifier = "result"
    var testName: String?
    var testDescription: String?
    var questions: [QuestionsArray]?
    var countQuestion = 0
    var result = [Bool]()
    var resultPersent: Float?
//Character Variables
    var isCharacter: Bool = false
    var resultCharacter = ""
    var characterResultModel: CharacterResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        // Do any additional setup after loading the view.
        let backImage = UIImage(named: "back-button")
        let closeImage = UIImage(named: "close-button")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: backImage,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(backQuestion))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(closeTest))
        countQuestion = questions?.count ?? 0
        for _ in 0...countQuestion {
            result.append(false)
        }
        updateQuestion()
    }
    @objc func backQuestion() {
        if currentNumber > 0 {
            currentNumber-=2
            updateQuestion()
        }
    }
    @objc func closeTest() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func yesClick(_ sender: Any) {
        result[currentNumber] = true
        updateQuestion()
    }
    @IBAction func noClick(_ sender: Any) {
        result[currentNumber] = false
        updateQuestion()
    }
    func updateQuestion() {
        currentNumber += 1
        if currentNumber < questions?.count ?? 0 {
            questionLabel.text = questions?[currentNumber].question
            progressLabel.text = "\(currentNumber+1)/\(questions?.count ?? 0)"
        } else {
            if isCharacter {
                characterCalculate()
            } else {
                defaultCalculate()
            }
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        }
    }
    func defaultCalculate() {
        var countYes = 0
        for value in result {
            if value == true {
                countYes+=1
            }
        }
        resultPersent = Float(countYes)/Float(countQuestion)*100
    }
    func characterCalculate() {
        var count = 0
        var countYes = 0
        resultCharacter = ""
        for value in result {
            if value == true {
                countYes+=1
            }
            if count == 2 {
                resultCharacter+="\(countYes>=2 ? 1 : 0)"
                count = 0
                countYes = 0
            } else {
                count+=1
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultIdentifier {
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            if isCharacter {
                characterPrepare(resultController: resultController)
            } else {
                defaultPrepare(resultController: resultController)
            }
        }
    }
    func defaultPrepare(resultController: ResultTestViewController) {
        var str = "\(testName ?? "")"
        str+=" - \(resultPersent ?? 0.0)%"
        resultController.setNameResult(value: str)
        resultController.setTextResult(value: "\(testDescription ?? "")")
        let rTest = "\(resultPersent ?? 0.0)"
        switch testName ?? "" {
        case "Phlegmatic":
            PhlegmaticData().save(value: rTest)
        case "Melancholic":
            MelancholicData().save(value: rTest)
        case "Choleric":
            CholericData().save(value: rTest)
        case "Sanguine":
            SanguineData().save(value: rTest)
        case "Extrovert":
            ExtrovertCharacterTypeData().save(value: rTest)
        case "Introvert":
            IntrovertCharacterTypeData().save(value: rTest)
        default:
            break
        }
    }
    func characterPrepare(resultController: ResultTestViewController) {
        CharacterData().save(value: resultCharacter)
        resultController.setNameResult(value: testName ?? "Character Type Test")
        switch resultCharacter {
        case "1111":
            resultController.setTextResult(value: "\(characterResultModel?.r1111 ?? "")")
        case "1000":
            resultController.setTextResult(value: "\(characterResultModel?.r1000 ?? "")")
        case "1001":
            resultController.setTextResult(value: "\(characterResultModel?.r1001 ?? "")")
        case "1011":
            resultController.setTextResult(value: "\(characterResultModel?.r1011 ?? "")")
        case "0111":
            resultController.setTextResult(value: "\(characterResultModel?.r0111 ?? "")")
        case "0110":
            resultController.setTextResult(value: "\(characterResultModel?.r0110 ?? "")")
        case "0100":
            resultController.setTextResult(value: "\(characterResultModel?.r0100 ?? "")")
        case "0000":
            resultController.setTextResult(value: "\(characterResultModel?.r0000 ?? "")")
        case "1010":
            resultController.setTextResult(value: "\(characterResultModel?.r1010 ?? "")")
        case "1110":
            resultController.setTextResult(value: "\(characterResultModel?.r1110 ?? "")")
        case "1100":
            resultController.setTextResult(value: "\(characterResultModel?.r1100 ?? "")")
        case "0001":
            resultController.setTextResult(value: "\(characterResultModel?.r0001 ?? "")")
        case "0011":
            resultController.setTextResult(value: "\(characterResultModel?.r0011 ?? "")")
        case "0101":
            resultController.setTextResult(value: "\(characterResultModel?.r0101 ?? "")")
        case "1101":
            resultController.setTextResult(value: "\(characterResultModel?.r1101 ?? "")")
        case "0010":
            resultController.setTextResult(value: "\(characterResultModel?.r0010 ?? "")")
        default:
            resultController.setTextResult(value: "")
        }
    }
}
