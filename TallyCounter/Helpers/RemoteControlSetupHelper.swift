//
//  RemoteControlSetupHelper.swift
//  TallyCounter
//
//  Created by Luis Wu on 4/6/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//
import MediaPlayer

class RemoteControlSetupHelper {
    private static let SILENT_ASSET_NAME: String = "silent"
    private static let SILENT = NSDataAsset(name: RemoteControlSetupHelper.SILENT_ASSET_NAME)!
    private static weak var _audioPlayer: AVAudioPlayer? = nil
    
    static func setupRemoteControlEventsForResign() {
        MPRemoteCommandCenter.sharedCommandCenter().playCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().togglePlayPauseCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.enabled = false
    }
    
    static func setupRemoteControlEventsForActive() {
        MPRemoteCommandCenter.sharedCommandCenter().playCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().togglePlayPauseCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.enabled = true
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.enabled = true
    }
    
    static func setupRemoteControlEventsForBackground() {
        RemoteControlSetupHelper.setupRemoteControlEventsForActive()
    }
    
    static func occupyControlCenter() {
        // NOTE: this is a "somewhat" workaround of getting remote control events. Without playing a sound,
        // the commands of MPRemoteCommandCenter just simply won't trigger.
        if _audioPlayer == nil {
            _audioPlayer = try! AVAudioPlayer(data: SILENT.data, fileTypeHint: nil)
        }
        _audioPlayer?.play()
    }
    
    static func releaseControlCenter() {
        _audioPlayer?.stop()
        _audioPlayer = nil  // release
    }
}