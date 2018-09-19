//
//  HomeViewModel.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel : BaseViewModel {
    
    private let navigator: HomeNavigator
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    
    var viewControllers: [UIViewController] {
        return navigator.viewControllers()
    }
}
