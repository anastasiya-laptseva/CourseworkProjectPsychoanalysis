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
    private init(){}
    
    let keyDarkMode = "settings.isDarkMode"
    let keyProfile = "profile"
    
    func setDark(state: Bool) {
        UserDefaults.standard.set(state, forKey: keyDarkMode)
    }
    
    func isDark() -> Bool {
        return UserDefaults.standard.bool(forKey: keyDarkMode)
    }
    
    func backgroundSwitch(controller: UIViewController, navigation: UINavigationController?, views: [UIView]) {
//        return
        let darkColor = UIColor(red:15.0/255.0, green:86.0/255.0, blue:103.0/255.0, alpha:1.0)
        let color: UIColor = (SaveManager.shared.isDark() ? darkColor : (UIColor(named: "ViewControllerColor")) ?? .systemBackground)

        for view in views {
            view.backgroundColor = color
        }

        if let nc = navigation{
            nc.navigationBar.barTintColor = color
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
        }
        catch {}
       
        return nil
    }
    
}