//
//  HeroNavigator.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

protocol HeroNavigator {
    func moveToDetail(_ hero: Hero)
    func moveToHero()
}
class DefaultHeroNavigator: HeroNavigator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func moveToDetail(_ hero: Hero) {
        let navigator = DefaultDetailNavigator(navigator: navigation)
        let viewModel = DetailViewModel(navigator: navigator, hero: hero)
        let controller = DetailViewController.createWith(viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    func moveToHero() {
        let viewModel = HeroViewModel(navigator: self)
        let controller = HeroViewController.createWith(viewModel)
        navigation.viewControllers = [controller]
    }
}
