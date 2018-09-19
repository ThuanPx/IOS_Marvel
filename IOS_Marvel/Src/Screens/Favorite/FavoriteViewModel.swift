//
//  FavoriteViewModel.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewModel: BaseViewModel{
    
    private let navigator: FavoriteNavigator
    
    init(navigator: FavoriteNavigator) {
        self.navigator = navigator
    }
}
