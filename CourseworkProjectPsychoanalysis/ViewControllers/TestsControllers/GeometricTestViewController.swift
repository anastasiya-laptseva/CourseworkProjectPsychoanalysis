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
    let resultIdentifier = "resultGeometric"
    
    var geometricModel: GeometricEntity?
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = geometricModel?.question
        // Do any additional setup after loading the view.
    }
    
    @IBAction func squareButton(_ sender: Any) {
        result = geometricModel?.results.square
        goToResult()
    }
    @IBAction func triangleButton(_ sender: Any) {
        result = geometricModel?.results.triangle
        goToResult()
    }
    @IBAction func rectangleButton(_ sender: Any) {
        result = geometricModel?.results.rectangle
        goToResult()
    }
    @IBAction func circleButton(_ sender: Any) {
        result = geometricModel?.results.circle
        goToResult()
    }
    @IBAction func zigzagButton(_ sender: Any) {
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
