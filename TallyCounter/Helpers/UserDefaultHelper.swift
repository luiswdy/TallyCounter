//
//  UserDefaultHelper.swift
//  TallyCounter
//
//  Created by Luis Wu on 3/24/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import Foundation

public class UserDefaultHelper {
    private enum Keys: String {
        case Count = "count", Settings = "settings"
        
        static let allValues = [Count.rawValue, Settings.rawValue]
    }
    
    public static func loadCount() -> UInt? {
        return UInt(NSUserDefaults.standardUserDefaults().integerForKey(Keys.Count.rawValue))
    }
    
    public static func saveCount(count: UInt) {
        NSUserDefaults.standardUserDefaults().setInteger(Int(count), forKey: Keys.Count.rawValue)
    }
    
    public static func loadSettings() -> [String : Bool]? {
        return NSUserDefaults.standardUserDefaults().dictionaryForKey(Keys.Settings.rawValue) as? [String : Bool]
    }
    
    public static func saveSettings(settings: [String : Bool]) {
        NSUserDefaults.standardUserDefaults().setObject(settings, forKey: Keys.Settings.rawValue)
    }
    
    public static func clearSettings() {
        for key in Keys.allValues {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
        }
    }
}