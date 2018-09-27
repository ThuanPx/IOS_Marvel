//
//  URLTransform.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/24/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

class URLTransform: TransformType {
    public typealias Object = String
    public typealias JSON = String
    
    public init() {}
    
    func transformFromJSON(_ value: Any?) -> String? {
        guard let string = value as? String else {
            return nil
        }
        return "\(string)/standard_xlarge.jpg"
    }
    
    func transformToJSON(_ value: String?) -> String? {
        guard let value = value else {
            return nil
        }
        return value
    }
}
