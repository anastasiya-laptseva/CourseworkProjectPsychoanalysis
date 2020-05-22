//
//  SettingViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var darkModeSwitcher: UISwitch!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitcher.isOn = SaveManager.shared.isDark()
        backgroundSwitch()
    }
    
    @IBAction func changeSwitch(_ sender: Any) {
        SaveManager.shared.setDark(state: darkModeSwitcher.isOn)
        backgroundSwitch()
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        let switchButton = sender as! UISwitch
        Locale.current.localizedString(forCurrencyCode: "en-US")
    }
    
    func backgroundSwitch() {
        var array: [UIView] = [self.view]
        array.append(scrollView)
        array.append(stackView)
        
        for view in stackView.arrangedSubviews {
            array.append(view)
        }
        
        SaveManager.shared.backgroundSwitch(controller: self, navigation: self.navigationController, views: array)
    }

}
