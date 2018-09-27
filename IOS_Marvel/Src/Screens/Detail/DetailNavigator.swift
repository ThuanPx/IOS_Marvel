//
//  DetailNavigator.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/24/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

protocol DetailNavigator{
    
}

class DefaultDetailNavigator: DetailNavigator{
    private let navigatorController: UINavigationController
    
    init(navigator: UINavigationController) {
        self.navigatorController = navigator
    }
}
