//
//  HeroNavigator.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

public protocol HeroNavigator {
    func moveToDetail()
    func moveToHero()
}

class DefaultHeroNavigator: HeroNavigator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func moveToDetail() {
    }
    
    func moveToHero() {
        let viewModel = HeroViewModel(navigator: self)
        let controller = HeroViewController.createWith(viewModel)
        navigation.viewControllers = [controller]
    }
}
