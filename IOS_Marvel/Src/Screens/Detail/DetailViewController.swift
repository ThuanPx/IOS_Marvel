//
//  DetailViewController.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/24/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class DetailViewController: BaseViewController, ViewModelViewController {

    var viewModel: DetailViewModel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func setupUI() {
        navTitle = "Detail"
        navigationController?.setNavigationBarHidden(false, animated: true)
        lblName.textAlignment = .center
        lblDescription.textAlignment = .center
        lblDescription.numberOfLines = 0
        
        let decoded  = UserDefaults.standard.object(forKey: "heroes") as! Data
        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Hero]
        print("test \(decodedTeams)")
    }
    
    override func bindViewModel() {
        let input = DetailViewModel.Input()
        let output = viewModel.transform(input: input, with: bag)
        output.hero.drive(onNext:{ [weak self] hero in
        self?.bindHero(hero: hero)
        }).disposed(by: self)
    }
    
    private func bindHero(hero: Hero){
        if let url = hero.urlHero?.url {
            ivAvatar.kf.setImage(with: URL(string: url))
        }
        lblName.text = hero.name
        lblDescription.text = hero.des
    }
}
