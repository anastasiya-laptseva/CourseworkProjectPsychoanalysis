//
//  AuthorisationViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AuthorisationViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var registrationButton: BorderButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        let duration = 0.5
        AnimationManager.shared.animationFromFade(view: messageLabel, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: registrationButton, duration: duration, delay: 0.25)
        AnimationManager.shared.animationFromFade(view: loginButton, duration: duration, delay: 0.5)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        localizableString()
    }
    func localizableString() {
        //loginButton.titleLabel?.text = NSLocalizedString("keyLogin", comment: "")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
