//
//  HomeCollectionViewCell.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import Kingfisher
import WCLShineButton

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnLike: WCLShineButton!
    private var hero = Hero(id: 0, name: "", des: "", url: ImageHero(url: ""))
    
    @IBAction func actionLike(_ sender: WCLShineButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblName.textAlignment = .center
        lblName.backgroundColor = UIColor.red
        btnLike.backgroundColor = .clear
        var param2 = WCLShineParams()
        param2.bigShineColor = UIColor(rgb: (255,95,89))
        param2.smallShineColor = UIColor(rgb: (216,152,148))
        param2.animDuration = 1
        btnLike.params = param2
    }
    
    func bindHero(_ hero: Hero){
        self.hero = hero
        if let url = hero.urlHero?.url {
            ivAvatar.kf.setImage(with: URL(string: url))
        }
        lblName.text = hero.name
    }

}
