//
//  Hero.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

struct Hero {
    
    var id: Int?
    var name: String?
    var description: String?
    var urlHero: ImageHero?
    
}

extension Hero : Mappable{
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        urlHero <- map["thumbnail"]
    }
    
}
