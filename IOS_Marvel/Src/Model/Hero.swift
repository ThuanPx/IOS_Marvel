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
    var des: String?
    var urlHero: ImageHero?

    init(id: Int, name: String, des:String, url:ImageHero) {
        self.id = id
        self.name = name
        self.des = des
        self.urlHero = url
    }

    required init?(map: Map) {
    }


}

extension Hero : Mappable{

     func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        des <- map["description"]
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
//    var des: String?
//    var urlHero: ImageHero?
//
//    init(id: Int, name: String, des:String, url:ImageHero) {
//        self.id = id
//        self.name = name
//        self.des = des
//        self.urlHero = url
//    }
//
//    required convenience init?(coder aDecoder: NSCoder) {
//        //        let id = aDecoder.decodeInteger(forKey: "id")
//        //        let name = aDecoder.decodeObject(forKey: "name") as! String
//        //        let des = aDecoder.decodeObject(forKey: "des") as! String
//        //        let url = aDecoder.decodeObject(forKey: "url") as! String
//        //        self.init(id: id,name: name, des: des, url: ImageHero(url: url))
//        //    }
//        //
//        //    func encode(with aCoder: NSCoder) {
//        //        aCoder.encode(id, forKey: "id")
//        //        aCoder.encode(id, forKey: "name")
//        //        aCoder.encode(id, forKey: "des")
//        //        aCoder.encode(id, forKey: "url")
//        //    }
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
//        des <- map["description"]
//        urlHero <- map["thumbnail"]
//    }
//
//}
