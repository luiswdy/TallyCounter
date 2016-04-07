//
//  SettingsViewController.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import UIKit
import ReactiveCocoa

class SettignsViewController: UITableViewController {
    @IBOutlet private weak var _enabledSound: UITableViewCell!
    @IBOutlet private weak var _enabledVibration: UITableViewCell!
    
    private let _viewModel: SettingsViewModel
    
    required init?(coder aDecoder: NSCoder) {
        _viewModel = SettingsViewModel()
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        _viewModel = SettingsViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _viewModel.enabledSound.producer.startWithNext { [unowned self] (enabled) in
            if enabled {
                self._enabledSound.accessoryType = .Checkmark
            } else {
                self._enabledSound.accessoryType = .None
            }
        }
        _viewModel.enabledVibration.producer.startWithNext { (enabled) in
            if enabled {
                self._enabledVibration.accessoryType = .Checkmark
            } else {
                self._enabledVibration.accessoryType = .None
            }
        }
        _enabledSound.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleSound(_:))))
        _enabledVibration.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleVibration(_:))))
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _viewModel.saveSettings()
    }
    
    func toggleSound(sender: AnyObject) {
        _viewModel.toggleSound()
    }
    
    func toggleVibration(sender: AnyObject) {
        _viewModel.toggleVibration()
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
//    }
}