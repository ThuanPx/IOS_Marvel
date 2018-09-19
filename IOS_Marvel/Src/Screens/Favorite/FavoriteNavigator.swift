//
//  FavoriteNavigator.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

public protocol FavoriteNavigator{
    func moveToDetail()
    func moveToFavorite()
}

class DefaultFavoriteNavigator: FavoriteNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigator: UINavigationController) {
        navigationController = navigator
    }
    
    func moveToDetail() {
    }
    
    func moveToFavorite() {
        let viewModel = FavoriteViewModel(navigator: self)
        let controller = FavoriteViewController.createWith(viewModel)
        navigationController.viewControllers = [controller]
    }
}
