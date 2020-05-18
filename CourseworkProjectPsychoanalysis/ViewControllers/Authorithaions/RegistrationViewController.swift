//
//  RegistrationViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var loginEditText: UITextField!
    @IBOutlet weak var passwordEditTex: UITextField!
    @IBOutlet weak var repeatPasswordEditText: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var waitView: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaveManager.shared.backgroundSwitch(controller: self, navigation: self.navigationController, views: [self.view,scrollView,stackView])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func clickSignUp(_ sender: Any) {
        guard let nameText = nameEditText.text else{
            return
        }
        
        guard let loginText = loginEditText.text else {
            return
        }
        
        guard let passwordText = passwordEditTex.text else {
            return
        }
        
        guard let repeatPasswordText = repeatPasswordEditText.text else {
            return
        }
        
        if nameText.elementsEqual("") == true{
            AlertManager.shared.showAlert(text: "Empty name", self)
            return
        }
        
        if passwordText.elementsEqual(repeatPasswordText) == false {
            AlertManager.shared.showAlert(text: "Password mismatch", self)
            return
        }
        
        UsersManager.shared.registrationUser(name: nameText, login: loginText, password: passwordText, loading: waitView) { (state) in
            if state{
                ControllerManager.shared.setWelcomeControllerRoot()
                UsersManager.shared.saveLogin(state: true)
            }
            else{
                AlertManager.shared.showAlert(text: "Error registration", self)
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
