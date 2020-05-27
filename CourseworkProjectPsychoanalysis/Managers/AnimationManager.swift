//
//  AnimationManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/28/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class AnimationManager {
    static let shared = AnimationManager()
    private init() {}
    func animationFromFade(view: UIView, duration: Double, delay: Double = 0.0) {
        view.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            view.alpha = 1.0
        }, completion: nil)
    }
    func animationToFade(view: UIView, duration: Double, delay: Double) {
        view.alpha = 1.0
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            view.alpha = 0.0
        }, completion: nil)
    }
    func animationTextWithSymbol(label: UILabel, newText: String, characterDelay: TimeInterval) {
        DispatchQueue.main.async {
            label.text? = ""
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    label.text?.append(character)
                }
            }
        }
    }
}
