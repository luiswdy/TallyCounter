//
//  MainViewModel.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import Foundation
import ReactiveCocoa

class MainViewModel: NSObject {
    private let _numberFormatter: NSNumberFormatter
    private let _clues: Clues
    private(set) var formattedCount: MutableProperty<String>
    private(set) var state: StateModel
    
    override init() {
        _numberFormatter = NSNumberFormatter()
        _numberFormatter.numberStyle = .DecimalStyle
        state = StateModel.sharedInstance
        _clues = Clues()
        formattedCount = MutableProperty<String>(_numberFormatter.stringFromNumber(state.count)!)
        super.init()
    }
    
    func add(increment: IncrementType = .Default) {
        state.count += increment.rawValue
        saveCount()
        formattedCount.value = _numberFormatter.stringFromNumber(state.count)!
        _clues.doClues()
    }
    
    func reset() {
        state.count = 0
        saveCount()
        formattedCount.value = _numberFormatter.stringFromNumber(state.count)!
    }
    
    func loadClues() {
        _clues.updateSettings(state.settings)
    }
    
    private func saveCount() {
        UserDefaultHelper.saveCount(state.count)    // save immediately as the count is precious
    }
}