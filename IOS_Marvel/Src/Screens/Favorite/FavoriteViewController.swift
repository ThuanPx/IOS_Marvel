//
//  FavoriteViewController.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

class FavoriteViewController: BaseViewController, ViewModelViewController {

    var viewModel: FavoriteViewModel!
    
    override func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func bindViewModel() {
        
    }

}
