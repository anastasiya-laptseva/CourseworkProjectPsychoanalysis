//
//  AllTestsTableViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AllTestsTableViewController: UITableViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()

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
            questionsTemperament = temperamentsTests?.phlegmatic as! [QuestionsArray]
            testName = "Phlegmatic"
            testDescription = temperamentsTests?.results.phlegmatic as! String
            break
        case 1:
            questionsTemperament = temperamentsTests?.melancholic as! [QuestionsArray]
            testName = "Melancholic"
            testDescription = temperamentsTests?.results.melancholic as! String
            break
        case 2:
            questionsTemperament = temperamentsTests?.choleric as! [QuestionsArray]
            testName = "Choleric"
            testDescription = temperamentsTests?.results.choleric as! String
            break
        case 3:
            questionsTemperament = temperamentsTests?.sanguine as! [QuestionsArray]
            testName = "Sanguine"
            testDescription = temperamentsTests?.results.sanguine as! String
            break
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
            questionsCharacterType = characterTypeTests?.extrovert as! [QuestionsArray]
            testName = "Extrovert"
            testDescription = characterTypeTests?.results.extrovert as! String
            break
        case 1:
            questionsCharacterType = characterTypeTests?.introvert as! [QuestionsArray]
            testName = "Introvert"
            testDescription = characterTypeTests?.results.introvert as! String
            break
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
            questionsCharacter = characterTest?.questions as! [QuestionsArray]
            break
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
