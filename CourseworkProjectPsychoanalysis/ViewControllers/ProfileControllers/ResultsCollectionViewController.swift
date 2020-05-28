//
//  CollectionViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/17/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let toControllerIdentifier = "completeResult"

class ResultsCollectionViewController: UICollectionViewController {
//    variables
    let sectionCount = 2
    var data = AllTestsData()
    var elementClick: TestsDataProtocol?
// view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, collectionView])
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        data.load()
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.loadTests.count/sectionCount+1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return min(sectionCount, data.loadTests.count-sectionCount*section)
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ResultCollectionViewCell
        // Configure the cell
        let element = data.loadTests[indexPath.row+sectionCount*indexPath.section]
        cell.setCell(name: element.getName(), description: element.getShortDescription(), image: element.getImage())
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        elementClick = data.loadTests[indexPath.row+sectionCount*indexPath.section]
        self.performSegue(withIdentifier: toControllerIdentifier, sender: self)
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toControllerIdentifier {
            guard let resultController = segue.destination as? CompletedResultControllerViewController ?? nil else {
                return
            }
            resultController.setData(name: elementClick?.getName() ?? "",
                                     description: elementClick?.getLongDescription() ?? "")
        }
    }
}
