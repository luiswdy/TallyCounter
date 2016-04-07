//
//  ViewController.swift
//  TallyCounter
//
//  Created by Luis Wu on 3/24/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import UIKit
import MediaPlayer
import ReactiveCocoa

class MainViewController: UIViewController {
    @IBOutlet private weak var _btnAdd: CustomRoundButton!
    @IBOutlet private weak var _btnReset: CustomRoundButton!
    @IBOutlet private weak var _lblCount: UILabel!
    
    private let _viewModel: MainViewModel
    
    
    required init?(coder aDecoder: NSCoder) {
        _viewModel = MainViewModel()
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        _viewModel = MainViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        _viewModel.formattedCount.producer.startWithNext { [weak self] (newFormattedCount) in
            self?._lblCount.text = newFormattedCount
        }   // 1-way binding with viewModel
        setupRemoteControlCommands()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
        super.viewWillAppear(animated)
        _viewModel.loadClues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupRemoteControlCommands() {
        // We want to intercept these events
        MPRemoteCommandCenter.sharedCommandCenter().playCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().togglePlayPauseCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.enabled = true
        
        // Disable others as we don't need them
        MPRemoteCommandCenter.sharedCommandCenter().pauseCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().stopCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().enableLanguageOptionCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().disableLanguageOptionCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().skipForwardCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().skipBackwardCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().seekForwardCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().seekBackwardCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().ratingCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().changePlaybackRateCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().likeCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().dislikeCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().bookmarkCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().changePlaybackPositionCommand.enabled = false
        
        // Define closures for interested commands
        MPRemoteCommandCenter.sharedCommandCenter().playCommand.addTargetWithHandler { [unowned self] (event) -> MPRemoteCommandHandlerStatus in
            self._viewModel.add()
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().togglePlayPauseCommand.addTargetWithHandler { [unowned self] (event) -> MPRemoteCommandHandlerStatus in
            self._viewModel.add()
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.addTargetWithHandler { [unowned self] (event) -> MPRemoteCommandHandlerStatus in
            self._viewModel.add(IncrementType.NextTrack)
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.addTargetWithHandler { [unowned self] (event) -> MPRemoteCommandHandlerStatus in
            self._viewModel.add(IncrementType.PreviousTrack)
            return .Success
        }
    }
    
    @IBAction func add(sender: AnyObject) {
        _viewModel.add()
    }
    
    @IBAction func reset(sender: AnyObject) {
        let alert = UIAlertController(title: "Reset counter", message: "Are you going to reset the counter?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { [unowned self] (action) in
            self._viewModel.reset()
            }))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: { (action) in
            print("Reset canceled")
        }))
        self.presentViewController(alert, animated: true) { 
            print("done")
        }
        
    }

}

