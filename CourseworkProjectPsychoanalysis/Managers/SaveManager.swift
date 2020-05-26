//
//  Save Manager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class SaveManager {
    static let shared = SaveManager()
    private init() {}
    
    let keyDarkMode = "settings.isDarkMode"
    let keyProfile = "profile"
    func setDark(state: Bool) {
        UserDefaults.standard.set(state, forKey: keyDarkMode)
    }
    func isDark() -> Bool {
        return UserDefaults.standard.bool(forKey: keyDarkMode)
    }
    func backgroundSwitch(controller: UIViewController, navigation: UINavigationController?, views: [UIView]) {
        let darkColor = UIColor(red: 0.261, green: 0.261, blue: 0.261, alpha: 1.0)
        let color: UIColor = SaveManager.shared.isDark() ? darkColor:
            (UIColor(named: "ViewControllerColor") ?? UIColor.gray)
        for view in views {
            view.backgroundColor = color
        }
        if let navContr = navigation {
            navContr.navigationBar.barTintColor = color
        }
    }
    func saveProfile(profile: Profile) {
        do {
            let jsonData = try JSONEncoder().encode(profile)
            UserDefaults.standard.set(jsonData, forKey: keyProfile)
            UserDefaults.standard.synchronize()
        } catch { }
    }
    func loadProfile() -> Profile? {
        do {
            if let value: AnyObject = UserDefaults.standard.object(forKey: keyProfile) as AnyObject? {
                let profile = try JSONDecoder().decode(Profile.self, from: value as! Data)
                return profile
            }
        } catch {}
        return nil
    }
    func saveWithKey(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func loadWithKey(key: String) -> String {
        if let value: AnyObject = UserDefaults.standard.object(forKey: key) as AnyObject? {
            let str = value as! String
            return str
        }
        return ""
    }
    func saveWithKey(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func loadWithKey(key: String) -> Int {
        if let value: AnyObject = UserDefaults.standard.object(forKey: key) as AnyObject? {
            let str = value as! Int
            return str
        }
        return 0
    }
}
