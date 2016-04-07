//
//  Enums.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

public enum SettingOptions: String {
    case Sound = "sound" , Vibration = "vibration"
    static let allValues = [Sound.rawValue, Vibration.rawValue]
}

public enum IncrementType: UInt {
    case Default = 1,  NextTrack, PreviousTrack
}