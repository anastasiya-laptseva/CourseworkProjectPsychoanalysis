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
    let sectionCount = 2
    var data = AllTestsData()
    var elementClick: TestsDataProtocol?
    
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == toControllerIdentifier {
            guard let resultController = segue.destination as? CompletedResultControllerViewController ?? nil else {
                return
            }
            resultController.setData(name: elementClick?.getName() ?? "",
                                     description: elementClick?.getLongDescription() ?? "")
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView,
     shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView,
     shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item,
     and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView,
     shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    override func collectionView(_ collectionView: UICollectionView,
     canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
    override func collectionView(_ collectionView: UICollectionView,
     performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    }
    */
}
