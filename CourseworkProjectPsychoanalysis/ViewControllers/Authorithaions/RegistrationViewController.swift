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
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginEditText: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordEditTex: UITextField!
    @IBOutlet weak var rapeatPasswordLabel: UILabel!
    @IBOutlet weak var repeatPasswordEditText: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var signUpButton: BorderButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        let duration = 0.5
        AnimationManager.shared.animationFromFade(view: welcomeLabel, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: nameLabel, duration: duration, delay: 0.25)
        AnimationManager.shared.animationFromFade(view: nameEditText, duration: duration, delay: 0.5)
        AnimationManager.shared.animationFromFade(view: loginLabel, duration: duration, delay: 0.75)
        AnimationManager.shared.animationFromFade(view: loginEditText, duration: duration, delay: 1.0)
        AnimationManager.shared.animationFromFade(view: passwordLabel, duration: duration, delay: 1.25)
        AnimationManager.shared.animationFromFade(view: passwordEditTex, duration: duration, delay: 1.5)
        AnimationManager.shared.animationFromFade(view: rapeatPasswordLabel, duration: duration, delay: 1.75)
        AnimationManager.shared.animationFromFade(view: repeatPasswordEditText, duration: duration, delay: 2.0)
        AnimationManager.shared.animationFromFade(view: signUpButton, duration: duration, delay: 2.25)
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func clickSignUp(_ sender: Any) {
        guard let nameText = nameEditText.text else {
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
        if nameText.elementsEqual("") == true {
            AlertManager.shared.showAlert(text: "Empty name", self)
            return
        }
        if passwordText.elementsEqual(repeatPasswordText) == false {
            AlertManager.shared.showAlert(text: "Password mismatch", self)
            return
        }
        UsersManager.shared.registrationUser(name: nameText,
                                             login: loginText,
                                             password: passwordText,
                                             loading: waitView) { (state, error) in
            if state {
                ControllerManager.shared.setWelcomeControllerRoot()
                UsersManager.shared.saveLogin(state: true)
            } else {
                AlertManager.shared.showAlert(text: "Error registration: \(error)", self)
            }
        }
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let kbSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= kbSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
