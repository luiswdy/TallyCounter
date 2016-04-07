//
//  AppDelegate.swift
//  TallyCounter
//
//  Created by Luis Wu on 3/24/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupAppearance()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        print("resign active")
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        RemoteControlSetupHelper.setupRemoteControlEventsForResign()
        RemoteControlSetupHelper.occupyControlCenter()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        print("entered background")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print("entering background")
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("become active")
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        RemoteControlSetupHelper.occupyControlCenter()
    }

    func applicationWillTerminate(application: UIApplication) {
        print("will terminate")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaultHelper.saveSettings(StateModel.sharedInstance.settings)
        UserDefaultHelper.saveCount(StateModel.sharedInstance.count)
    }

    private func setupAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.themeColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UITableView.appearance().tintColor = UIColor.themeColor()
    }

}

