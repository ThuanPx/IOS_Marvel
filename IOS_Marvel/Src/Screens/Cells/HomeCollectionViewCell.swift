//
//  HomeCollectionViewCell.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblName.textAlignment = .center
        lblName.backgroundColor = UIColor.red
    }
    
    func bindHero(_ hero: Hero){
        if let url = hero.urlHero?.url {
            ivAvatar.kf.setImage(with: URL(string: url+"/standard_xlarge.jpg"))
        }
        lblName.text = hero.name
    }

}
