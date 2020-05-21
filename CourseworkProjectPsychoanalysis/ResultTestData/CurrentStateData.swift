//
//  CurrentStateData.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/20/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import Foundation

enum ECurrentState{
    case currentStateHealth
    case currentStateActivity
    case currentStateMood
}

class CurrentStateData {
    let keyHealth = "result_current_state_health"
    let keyActivity = "result_current_state_activity"
    let keyMood = "result_current_state_mood"
    
    func set(key: ECurrentState, value: Int) {
        var keySave = ""
        switch key {
        case .currentStateHealth:
            keySave = keyHealth
            break
        case .currentStateActivity:
            keySave = keyActivity
            break
        case .currentStateMood:
            keySave = keyMood
            break
        }
        
        SaveManager.shared.saveWithKey(key: keySave, value: value)
    }
    
    func get(key: ECurrentState) -> Int {
        var keySave = ""
        switch key {
        case .currentStateHealth:
            keySave = keyHealth
            break
        case .currentStateActivity:
            keySave = keyActivity
            break
        case .currentStateMood:
            keySave = keyMood
            break
        }
        
        return SaveManager.shared.loadWithKey(key: keySave)
    }
}
