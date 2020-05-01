//
//  AlertManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

public class AlertManager {
    static let shared = AlertManager()
    
    private init(){}
    
    func showAlert(text: String, _ sender: Any) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sorry", style: UIAlertAction.Style.default, handler: nil))
        (sender as AnyObject).present(alert, animated: true, completion: nil)
    }
}
