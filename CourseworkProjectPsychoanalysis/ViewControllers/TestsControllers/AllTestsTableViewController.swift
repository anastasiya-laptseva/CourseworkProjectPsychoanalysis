//
//  AllTestsTableViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AllTestsTableViewController: UITableViewController {
    
    let arrayTests = [
        ["Phlegmatic Test","Melancholic Test","Choleric Test","Sanguine Test"],
        ["External Test","Valuation Test"],
        ["Character Type Test","Character Test","Difficulty Test"],
        ["Geometric test","Favorite color test"]
    ]
    
    let arrayNameSection = [ "Temperament Test","Somatipology", "Psychology", "Perception"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
  
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
