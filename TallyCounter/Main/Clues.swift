//
//  Clues.swift
//  TallyCounter
//
//  Created by Luis Wu on 3/24/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//
import AudioToolbox

public class Clues {
    private static let _mapping = [
        SettingOptions.Sound.rawValue : 1103,
        SettingOptions.Vibration.rawValue : kSystemSoundID_Vibrate
    ]
    
    var enabledClues = Array<SystemSoundID>()
    
    func doClues() {
        for clue in enabledClues {
            AudioServicesPlaySystemSound(clue)
        }
    }
    
    func updateSettings(settings: Settings) {
        enabledClues.removeAll()
        for (key, value) in settings where value == true {
            print("key: \(key), value: \(value)")
            enabledClues.append(Clues._mapping[key]!)
        }
    }
}
