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
    
    //Character Variables
    var isCharacter: Bool = false
    var resultCharacter = ""
    var characterResultModel: CharacterResult?

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
            
            if isCharacter{
                characterCalculate()
            }
            else{
                defaultCalculate()
            }
            
            self.performSegue(withIdentifier: resultIdentifier, sender: self)
        }
    }

    func defaultCalculate() {
        var countYes = 0
        for value in result {
            if value == true{
                countYes+=1
            }
        }
        resultPersent = Float(countYes)/Float(countQuestion)*100
    }

    func characterCalculate(){
        var count = 0
        var countYes = 0
        resultCharacter = ""
        for value in result {
            if value == true{
                countYes+=1
            }
            if count == 2{
                resultCharacter+="\(countYes>=2 ? 1 : 0)"
                count = 0
                countYes = 0
            }
            else{
                count+=1
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultIdentifier{
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            
            if(isCharacter){
                characterPrepare(resultController: resultController)
            }
            else{
                defaultPrepare(resultController: resultController)
            }
        }
    }
    
    func defaultPrepare(resultController: ResultTestViewController) {
        var str = "\(testName ?? "")"
        str+=" - \(resultPersent ?? 0.0)%"
        resultController.setNameResult(value: str)
        resultController.setTextResult(value: "\(testDescription ?? "")")
    }
    
    func characterPrepare(resultController: ResultTestViewController)  {
        resultController.setNameResult(value: testName ?? "Character Type Test")
        switch resultCharacter {
        case "0000":
            resultController.setTextResult(value: "\(characterResultModel?.r0000 ?? "")")
            break
        case "0001":
            resultController.setTextResult(value: "\(characterResultModel?.r0001 ?? "")")
            break
        case "1010":
            resultController.setTextResult(value: "\(characterResultModel?.r1010 ?? "")")
            break
        case "1011":
            resultController.setTextResult(value: "\(characterResultModel?.r1011 ?? "")")
            break
        case "1100":
            resultController.setTextResult(value: "\(characterResultModel?.r1100 ?? "")")
            break
        case "1101":
            resultController.setTextResult(value: "\(characterResultModel?.r1101 ?? "")")
            break
        case "1110":
            resultController.setTextResult(value: "\(characterResultModel?.r1110 ?? "")")
            break
        case "1111":
            resultController.setTextResult(value: "\(characterResultModel?.r1111 ?? "")")
            break
        case "0111":
            resultController.setTextResult(value: "\(characterResultModel?.r0111 ?? "")")
            break
        case "0110":
            resultController.setTextResult(value: "\(characterResultModel?.r0110 ?? "")")
            break
        case "0100":
            resultController.setTextResult(value: "\(characterResultModel?.r0100 ?? "")")
            break
        case "0000":
            resultController.setTextResult(value: "\(characterResultModel?.r0000 ?? "")")
            break
        case "0001":
            resultController.setTextResult(value: "\(characterResultModel?.r0001 ?? "")")
            break
        case "0011":
            resultController.setTextResult(value: "\(characterResultModel?.r0011 ?? "")")
            break
        case "0101":
            resultController.setTextResult(value: "\(characterResultModel?.r0101 ?? "")")
            break
        case "0010":
            resultController.setTextResult(value: "\(characterResultModel?.r0010 ?? "")")
            break
        default:
            resultController.setTextResult(value: "")
            break
        }
    }
}
