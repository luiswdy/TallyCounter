//
//  SettingsViewModel.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import Foundation
import ReactiveCocoa

class SettingsViewModel: NSObject {
    private let _state: StateModel
    private(set) var enabledSound: MutableProperty<Bool>
    private(set) var enabledVibration: MutableProperty<Bool>
    
    override init() {
        _state = StateModel.sharedInstance
        enabledSound = MutableProperty<Bool>(_state.settings[SettingOptions.Sound.rawValue]!)
        enabledVibration = MutableProperty<Bool>(_state.settings[SettingOptions.Vibration.rawValue]!)
        super.init()
    }
    
    func toggleSound() {
        enabledSound.value = !enabledSound.value
        _state.settings[SettingOptions.Sound.rawValue] = enabledSound.value
    }
    
    func toggleVibration() {
        enabledVibration.value = !enabledVibration.value
        _state.settings[SettingOptions.Vibration.rawValue] = enabledVibration.value
    }
    
    func saveSettings() {
        UserDefaultHelper.saveSettings(_state.settings)
    }
}