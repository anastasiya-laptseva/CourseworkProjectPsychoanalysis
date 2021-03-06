//
//  LoginViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: BorderButton!
    @IBOutlet weak var secureIcon: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var waitView: UIView!
    var secure: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        passwordTextField.isSecureTextEntry = !secure
        let duration = 0.5
        AnimationManager.shared.animationFromFade(view: welcomeLabel, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: loginLabel, duration: duration, delay: 0.25)
        AnimationManager.shared.animationFromFade(view: loginTextField, duration: duration, delay: 0.5)
        AnimationManager.shared.animationFromFade(view: passwordLabel, duration: duration, delay: 0.75)
        AnimationManager.shared.animationFromFade(view: passwordView, duration: duration, delay: 1.0)
        AnimationManager.shared.animationFromFade(view: logInButton, duration: duration, delay: 1.25)
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    @IBAction func logInButton(_ sender: Any) {
        guard let loginText = loginTextField.text else {
            return
        }
        guard let passwordText = passwordTextField.text else {
            return
        }
        FirebaseModule.shared.logIn(email: loginText,
                                    password: passwordText,
                                    loading: waitView,
                                    completion: { (state) in
            if state {
                ControllerManager.shared.setWelcomeControllerRoot()
                UsersManager.shared.saveLogin(state: true)
            } else {
                AlertManager.shared.showAlert(text: "Login or password is not correct", self)
            }
        })
    }
    @IBAction func iconSecureTouch(_ sender: Any) {
        if secure == true {
            secureIcon.setImage(UIImage(named: "sequrityOpen"), for: .normal)
        } else {
            secureIcon.setImage(UIImage(named: "sequrityClosed"), for: .normal)
        }
        secure = !secure
        passwordTextField.isSecureTextEntry = !secure
    }
}
