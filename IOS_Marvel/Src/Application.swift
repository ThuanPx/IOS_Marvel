//
//  Application.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/19/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit
import AlamofireNetworkActivityLogger

final class Application {
    
    static let shared = Application()
    
    private init() {
    }
    
    func configureMainScreen(in window: UIWindow){
        let navigation = BaseNavigationController()
        let homeNavigation = DefaultHomeNavigator(navigation: navigation)
        navigation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigation
        homeNavigation.moveToHome()
    }
    
    func configureLogging(){
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
}
