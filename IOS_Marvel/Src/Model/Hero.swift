//
//  Hero.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

class Hero {
    
    var id: Int?
    var name: String?
    var description: String?
    var urlHero: ImageHero?
    
    init(id: Int, name: String, des:String, url:ImageHero) {
        self.id = id
        self.name = name
        self.description = des
        self.urlHero = url
    }
    
    required init?(map: Map) {
    }
}

extension Hero : Mappable{
    
     func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        urlHero <- map["thumbnail"]
    }
    
    public static func == (lhs: Hero, rhs: Hero) -> Bool {
        return lhs.id == rhs.id
    }
    
}

//struct Hero {
//
//    var id: Int?
//    var name: String?
//    var description: String?
//    var urlHero: ImageHero?
//
//    init(id: Int, name: String, des:String, url:ImageHero) {
//        self.id = id
//        self.name = name
//        self.description = des
//        self.urlHero = url
//    }
//}
//
//extension Hero : Mappable{
//
//    init?(map: Map) {
//    }
//
//    mutating func mapping(map: Map) {
//        id <- map["id"]
//        name <- map["name"]
//        description <- map["description"]
//        urlHero <- map["thumbnail"]
//    }
//
//}
