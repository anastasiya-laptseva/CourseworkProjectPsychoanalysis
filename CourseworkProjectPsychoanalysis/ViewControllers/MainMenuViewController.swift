//
//  MainMenuControllerViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/26/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var profileButton: BorderButton!
    @IBOutlet weak var testsButton: BorderButton!
    @IBOutlet weak var mapButton: BorderButton!
    @IBOutlet weak var settingsButton: BorderButton!
    @IBOutlet weak var passedTestsButton: BorderButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let logoutStr = LocalizationManager.shared.getText(key: LocalizationManager.KEY_LOGOUT)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: logoutStr,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(logoutClick))
        let duration = 0.5
        AnimationManager.shared.animationFromFade(view: welcomeLabel, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: profileButton, duration: duration, delay: 0.2)
        AnimationManager.shared.animationFromFade(view: testsButton, duration: duration, delay: 0.3)
        AnimationManager.shared.animationFromFade(view: mapButton, duration: duration, delay: 0.4)
        AnimationManager.shared.animationFromFade(view: settingsButton, duration: duration, delay: 0.5)
        AnimationManager.shared.animationFromFade(view: passedTestsButton, duration: duration, delay: 0.6)
    }
    override func viewWillAppear(_ animated: Bool) {
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
    }
    @objc func logoutClick() {
        print("logoutClick")
        UsersManager.shared.saveLogin(state: false)
        ControllerManager.shared.setLoginControllerRoot()
    }
}
