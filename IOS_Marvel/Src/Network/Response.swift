//
//  Response.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/21/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Response {
    
    public var data: [String: Any]?
}

extension Response: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        data <- map["data"]
    }
}
