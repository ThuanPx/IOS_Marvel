//
//  HomeViewController.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController, ViewModelViewController {
    
    enum TabbarItem: Int {
        case Hero
        //case Favorite
    
        func title() -> String{
            switch self {
            case .Hero:
                return "Hero"
//            case .Favorite:
//                return "Favorite"
            }
        }
        
        func image() -> UIImage {
            switch self {
            case .Hero:
                return UIImage(named: "ic_hero")!
            }
        }
    }

    var viewModel: HomeViewModel!{
        didSet{
            viewControllers = viewModel.viewControllers
            setupTabbar()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        tabBar.barTintColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupTabbar() {
        guard let items = tabBar.items else { return }
        for(index, item) in items.enumerated(){
            guard let enumItem = TabbarItem(rawValue: index) else { continue }
            item.title = enumItem.title()
            item.image = enumItem.image()
        }
    }
    
    func select(_ item: TabbarItem) {
        selectedIndex = item.rawValue
    }
    
}
