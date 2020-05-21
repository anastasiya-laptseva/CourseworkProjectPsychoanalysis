//
//  MainMenuControllerViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/26/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logoutStr = LocalizationManager.shared.getText(key: LocalizationManager.KEY_LOGOUT)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: logoutStr, style: .plain, target: self, action: #selector(logoutClick))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SaveManager.shared.backgroundSwitch(controller: self, navigation: self.navigationController, views: [self.view,scrollView,stackView])
    }
    
    @objc func logoutClick() {
        print("logoutClick")
        UsersManager.shared.saveLogin(state: false)
        ControllerManager.shared.setLoginControllerRoot()
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
