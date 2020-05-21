//
//  FavoriteColorTestViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/12/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class FavoriteColorTestViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    let resultIdentifier = "resultFavorite"
    
    var favoriteModel: FavoriteColorEntity?
    var result: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = favoriteModel?.question
        // Do any additional setup after loading the view.
    }
    
    @IBAction func whiteClick(_ sender: Any) {
        FavotiteColorData().save(value: "white")
        result = favoriteModel?.results.white as! String
        goToResult()
    }
    @IBAction func blackClick(_ sender: Any) {
        FavotiteColorData().save(value: "black")
        result = favoriteModel?.results.black as! String
        goToResult()
    }
    @IBAction func grayClick(_ sender: Any) {
        FavotiteColorData().save(value: "gray")
        result = favoriteModel?.results.gray as! String
        goToResult()
    }
    @IBAction func redClick(_ sender: Any) {
        FavotiteColorData().save(value: "red")
        result = favoriteModel?.results.red as! String
        goToResult()
    }
    @IBAction func orangeClick(_ sender: Any) {
        FavotiteColorData().save(value: "orange")
        result = favoriteModel?.results.orange as! String
        goToResult()
    }
    @IBAction func brownClick(_ sender: Any) {
        FavotiteColorData().save(value: "brown")
        result = favoriteModel?.results.brown as! String
        goToResult()
    }
    @IBAction func yellowClick(_ sender: Any) {
        FavotiteColorData().save(value: "yellow")
        result = favoriteModel?.results.yellow as! String
        goToResult()
    }
    @IBAction func pinkClick(_ sender: Any) {
        FavotiteColorData().save(value: "pink")
        result = favoriteModel?.results.pink as! String
        goToResult()
    }
    @IBAction func blueClick(_ sender: Any) {
        FavotiteColorData().save(value: "blue")
        result = favoriteModel?.results.blue as! String
        goToResult()
    }
    @IBAction func greenClick(_ sender: Any) {
        FavotiteColorData().save(value: "green")
        result = favoriteModel?.results.green as! String
        goToResult()
    }
    
    func goToResult() {
        self.performSegue(withIdentifier: resultIdentifier, sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == resultIdentifier {
            guard let resultController = segue.destination as? ResultTestViewController ?? nil else {
                return
            }
            resultController.setNameResult(value: "Favorite Color Test")
            resultController.setTextResult(value: result ?? "")
        }
    }
}
