//
//  StateModel.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import Foundation

class StateModel {
    var count: UInt = 0
    var settings: Settings = [SettingOptions.Sound.rawValue : true, SettingOptions.Vibration.rawValue: true]
    static let sharedInstance = StateModel()
    
    private init() {
        if let savedCount = UserDefaultHelper.loadCount() {
            count = savedCount
        }
        if let currentSettings = UserDefaultHelper.loadSettings() {
            settings = currentSettings
        }
    }
}