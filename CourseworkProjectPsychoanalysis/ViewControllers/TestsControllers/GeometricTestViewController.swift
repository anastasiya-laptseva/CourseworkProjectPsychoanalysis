//
//  GeometricTestViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class GeometricTestViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    let resultIdentifier = "resultGeometric"
    
    var geometricModel: GeometricEntity?
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self, navigation: self.navigationController, views: [self.view,scrollView,stackView])
        questionLabel.text = geometricModel?.question
        // Do any additional setup after loading the view.
    }
    
    @IBAction func squareButton(_ sender: Any) {
        GeometricData().save(value: "square")
        result = geometricModel?.results.square
        goToResult()
    }
    @IBAction func triangleButton(_ sender: Any) {
        GeometricData().save(value: "triangle")
        result = geometricModel?.results.triangle
        goToResult()
    }
    @IBAction func rectangleButton(_ sender: Any) {
        GeometricData().save(value: "rectangle")
        result = geometricModel?.results.rectangle
        goToResult()
    }
    @IBAction func circleButton(_ sender: Any) {
        GeometricData().save(value: "circle")
        result = geometricModel?.results.circle
        goToResult()
    }
    @IBAction func zigzagButton(_ sender: Any) {
        GeometricData().save(value: "zigzag")
        result = geometricModel?.results.zigzag
        goToResult()
    }
    
    func goToResult() {
        self.performSegue(withIdentifier: resultIdentifier, sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultIdentifier{
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            resultController.setNameResult(value: "Geometric Test")
            resultController.setTextResult(value: result ?? "")
        }
    }
}
