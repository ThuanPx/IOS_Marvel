//
//  HeroViewController.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import RxSwift

class HeroViewController: BaseViewController, ViewModelViewController {
    
    private struct Constants {
        static let API_KEY = "4582ff7d7509676253b6bc474a0020fb"
        static let IMAGE_FORMAT = "/standard_xlarge.jpg"
        static let TS = 131710.0
        static let HASH_KEY = "76cab7d2f2f52b9fe5ea485122e62c38"
    }

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionHero: UICollectionView!
    var viewModel: HeroViewModel!
    
    override func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func bindViewModel() {

        
        API.fetchHero(offset: 0, ts: Constants.TS, apiKey: Constants.API_KEY, hash: Constants.HASH_KEY)
        .subscribe()
        .disposed(by: bag )
    }
    
}
