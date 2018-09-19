//
//  HomeNavigator.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

public protocol HomeNavigator {
    func moveToHome()
    func viewControllers() -> [UIViewController]
}

class DefaultHomeNavigator :HomeNavigator {
    private let navigationController: UINavigationController
    
    init(navigation: UINavigationController) {
        navigationController = navigation
    }
    
    func moveToHome() {
        let viewModel = HomeViewModel(navigator: self)
        let controller = HomeViewController.createWith(viewModel)
        navigationController.viewControllers = [controller]
    }
    
    func viewControllers() -> [UIViewController] {
        let heroNavigation = BaseNavigationController()
        let heroNavigator = DefaultHeroNavigator(navigation: heroNavigation)
        heroNavigator.moveToHero()
        
        let favoriteNavigation = BaseNavigationController()
        let favoriteNavigator = DefaultFavoriteNavigator(navigator: favoriteNavigation)
        favoriteNavigator.moveToFavorite()
        
        return [heroNavigation,favoriteNavigation]
    }
    
}
