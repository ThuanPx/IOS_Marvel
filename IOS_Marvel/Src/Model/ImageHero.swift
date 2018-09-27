//
//  ImageHero.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImageHero {
    var url: String?
    
    init(url: String) {
        self.url = url
    }
}

extension ImageHero: Mappable{
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        url <- (map["path"], URLTransform())
    }
}
