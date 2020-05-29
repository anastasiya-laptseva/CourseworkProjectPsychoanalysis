//
//  ControllerManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class ControllerManager {
    static let shared = ControllerManager()
    private init() {}
    func setRootController(storiboardId: String) {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewContr = storyboard.instantiateViewController(withIdentifier: storiboardId)
        window.rootViewController = viewContr
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: window,
                          duration: duration,
                          options: options,
                          animations: {},
                          completion: { completed in })
    }
    func setWelcomeControllerRoot() {
        setRootController(storiboardId: "welcomeVC")
    }
    func setLoginControllerRoot() {
        setRootController(storiboardId: "loginVC")
    }
}
