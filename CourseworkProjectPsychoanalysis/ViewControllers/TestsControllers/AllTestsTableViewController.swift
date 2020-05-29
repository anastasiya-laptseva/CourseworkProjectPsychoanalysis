//
//  AllTestsTableViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AllTestsTableViewController: UITableViewController {
    // variables
    var section: Int?
    var indexRow: Int?
    let yesNoIdentifier = "yesNo"
    let colorIdentifier = "color"
    let geometricIdentifier = "geometric"
    let difficultIdentifier = "difficulty"
    var temperamentsTests: TemperamentEntity?
    var characterTypeTests: CharacterTypeEntity?
    var characterTest: CharacterEntity?
    var favoriteTest: FavoriteColorEntity?
    var geometricTest: GeometricEntity?
    var difficultyTest: DifficultyEntity?
    //    arrays for table view
    let arrayTestsEN = [
        ["Phlegmatic Test", "Melancholic Test", "Choleric Test", "Sanguine Test"],
        ["Extrovert", "Introvert"],
        ["Character Test", "Difficulty Test"],
        ["Geometric test", "Favorite color test"]
    ]
    let arrayTestsRU = [
        ["Флегматик", "Меланхолик", "Холерик", "Сангвиник"],
        ["Экстроверт", "Интроверт"],
        ["Тест на черты характера", "Тест на поведение в трудной ситуации"],
        ["Геометрический тест", "Тест по любимому цвету"]
    ]
    let arrayNameSectionEN = [ "Temperament tests", "Character type tests", "Psychology tests", "Perception tests"]
    let arrayNameSectionRU = [ "Тесты на тип тепмерамента",
                               "Тесты на тип характера",
                               "Психологические тесты",
                               "Тесты на восприятие"]
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, tableView])
        let loadTests = JSONManager().loadTest()
        temperamentsTests =  loadTests.temperamentTest
        characterTypeTests = loadTests.characterTypeTest
        characterTest = loadTests.characterTest
        favoriteTest = loadTests.favoriteColorTest
        geometricTest = loadTests.geometricTest
        difficultyTest = loadTests.difficultyTest
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        section = indexPath.section
        indexRow = indexPath.row
        if section == 0 || section == 1 || (section == 2 && indexRow == 0) {
            self.performSegue(withIdentifier: yesNoIdentifier, sender: self)
        } else if section == 2 {
            if indexRow == 1 {
                self.performSegue(withIdentifier: difficultIdentifier, sender: self)
            }
        } else if section == 3 {
            if indexRow == 0 {
                self.performSegue(withIdentifier: geometricIdentifier, sender: self)
            } else if indexRow == 1 {
                self.performSegue(withIdentifier: colorIdentifier, sender: self)
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayNameSectionEN.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if  NSLocale.preferredLanguages.first == "ru-US" {
            return arrayNameSectionRU[section]
        } else {
            return arrayNameSectionEN[section]
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayTestsEN[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var text = ""
        if  NSLocale.preferredLanguages.first == "ru-US" {
            text = arrayTestsRU[indexPath.section][indexPath.row]
        } else {
            text = arrayTestsEN[indexPath.section][indexPath.row]
        }
        cell.textLabel?.text = text
        return cell
    }
    
    // MARK: - Navigation
    
    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == yesNoIdentifier {
            yesNoSetUp(segue: segue)
        } else if segue.identifier == colorIdentifier {
            guard let favoriteColorTestController = segue.destination as? FavoriteColorTestViewController ?? nil else {
                return
            }
            if section == 3 && indexRow == 1 {
                self.setUpFavoriteColor(favoriteController: favoriteColorTestController)
            }
        } else if segue.identifier == geometricIdentifier {
            guard let geometricTestController = segue.destination as? GeometricTestViewController ?? nil else { return }
            if section == 3 && indexRow == 0 {
                self.setUpGeometric(geometricController: geometricTestController)
            }
        } else if segue.identifier == difficultIdentifier {
            guard let difficulty = segue.destination as? DifficultyTestQuestionsViewController ?? nil else {
                return
            }
            if section == 2 && indexRow == 1 {
                self.setUpDifficulty(difficultyController: difficulty)
            }
        }
    }
    func yesNoSetUp(segue: UIStoryboardSegue) {
        guard let testQuestionController = segue.destination as? YesNoTestQuestionsViewController ?? nil else {
            return
        }
        if section == 0 {
            self.setUpTemperament(testQuestionController: testQuestionController)
        } else if section == 1 {
            self.setUpCharacterType(testQuestionController: testQuestionController)
        } else if section == 2 && indexRow == 0 {
            self.setUpCharacter(testQuestionController: testQuestionController)
        }
    }
    func setUpTemperament(testQuestionController: YesNoTestQuestionsViewController) {
        var questionsTemperament = [QuestionsArray]()
        var testName = ""
        var testDescription = ""
        switch indexRow {
        case 0:
            if let questionsPhlegmatic = temperamentsTests?.phlegmatic {
                questionsTemperament = questionsPhlegmatic
            }
            testName = "Phlegmatic"
            if let phlegmaticResult = temperamentsTests?.results.phlegmatic {
                testDescription = phlegmaticResult
            }
        case 1:
            if let questionsMelancholic = temperamentsTests?.melancholic {
                questionsTemperament = questionsMelancholic
            }
            testName = "Melancholic"
            if let melancholicResult = temperamentsTests?.results.melancholic {
                testDescription = melancholicResult
            }
        case 2:
            if let questionsCholeric = temperamentsTests?.choleric {
                questionsTemperament = questionsCholeric
            }
            testName = "Choleric"
            if let cholericResult = temperamentsTests?.results.choleric {
                testDescription = cholericResult
            }
        case 3:
            if let questionsSanguine = temperamentsTests?.sanguine {
                questionsTemperament = questionsSanguine
            }
            testName = "Sanguine"
            if let sanguineResult = temperamentsTests?.results.sanguine {
                testDescription = sanguineResult
            }
        default:
            break
        }
        testQuestionController.questions = questionsTemperament
        testQuestionController.testName = testName
        testQuestionController.testDescription = testDescription
    }
    func setUpCharacterType(testQuestionController: YesNoTestQuestionsViewController) {
        var questionsCharacterType = [QuestionsArray]()
        var testName = ""
        var testDescription = ""
        switch indexRow {
        case 0:
            if let questionsExtrovert = characterTypeTests?.extrovert {
                questionsCharacterType = questionsExtrovert
            }
            testName = "Extrovert"
            if let resultsExtrovert = characterTypeTests?.results.extrovert {
                testDescription = resultsExtrovert
            }
        case 1:
            if let questionsIntrovert = characterTypeTests?.introvert {
                questionsCharacterType = questionsIntrovert
            }
            testName = "Introvert"
            if let resultsIntrovert = characterTypeTests?.results.introvert {
                testDescription = resultsIntrovert
            }
        default:
            break
        }
        testQuestionController.questions = questionsCharacterType
        testQuestionController.testName = testName
        testQuestionController.testDescription = testDescription
    }
    func setUpCharacter(testQuestionController: YesNoTestQuestionsViewController) {
        var questionsCharacter = [QuestionsArray]()
        switch indexRow {
        case 0:
            if let questions = characterTest?.questions {
                questionsCharacter = questions
            }
        default:
            break
        }
        testQuestionController.questions = questionsCharacter
        testQuestionController.isCharacter = true
        testQuestionController.characterResultModel = characterTest?.results
    }
    func setUpFavoriteColor(favoriteController: FavoriteColorTestViewController) {
        favoriteController.favoriteModel = favoriteTest
    }
    func setUpGeometric(geometricController: GeometricTestViewController) {
        geometricController.geometricModel = geometricTest
    }
    func setUpDifficulty(difficultyController: DifficultyTestQuestionsViewController) {
        difficultyController.difficultyModel = difficultyTest
    }
}
