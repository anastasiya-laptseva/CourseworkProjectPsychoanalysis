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
    var temperamentsTests: Tests?
    
    let arrayTests = [
        ["Phlegmatic Test","Melancholic Test","Choleric Test","Sanguine Test"],
        ["Extrovert","Introvert"],
        ["Character Test","Difficulty Test"],
        ["Geometric test","Favorite color test"]
    ]
    
    let arrayNameSection = [ "Temperament tests","Character type tests", "Psychology tests", "Perception tests"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        temperamentsTests =  JSONManager().loadTest()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        section = indexPath.section
        indexRow = indexPath.row
        
        if section == 0{
            self.performSegue(withIdentifier: yesNoIdentifier, sender: self)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayNameSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayNameSection[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayTests[section].count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayTests[indexPath.section][indexPath.row]
        return cell
    }


    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == yesNoIdentifier){
            guard let testQuestionController = segue.destination as? YesNoTestQuestionsViewController ?? nil else {
                return
            }
            
            if(section == 0){
                var questions = [QuestionsArray]()
                
                switch indexRow {
                case 0:
                    questions = temperamentsTests?.phlegmatic as! [QuestionsArray]
                    break
                case 1:
                    questions = temperamentsTests?.melancholic as! [QuestionsArray]
                    break
                case 2:
                    questions = temperamentsTests?.choleric as! [QuestionsArray]
                    break
                case 3:
                    questions = temperamentsTests?.sanguine as! [QuestionsArray]
                    break
                default:
                    break
                }
                
                testQuestionController.questions = questions
            }
        }
    }


}
