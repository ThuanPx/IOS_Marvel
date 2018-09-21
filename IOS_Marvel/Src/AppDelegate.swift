//
//  AppDelegate.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/19/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        Application.shared.configureMainScreen(in: window)
        //Application.shared.configureLogging()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
}

