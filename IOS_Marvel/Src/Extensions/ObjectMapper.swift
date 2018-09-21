//
//  ObjectMapperExt.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper

// MARK: Mapping Json Observable
extension Observable where E == [String: Any] {
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { (data) -> Observable<T> in
            guard let object = Mapper<T>().map(JSONObject: data) else {
                return Observable<T>.error(NSError())
            }
            return Observable<T>.just(object)
        }
    }
}

extension Observable where E == [[String: Any]] {
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { (data) -> Observable<[T]> in
            guard let arrayObject = Mapper<T>().mapArray(JSONObject: data) else {
                return Observable<[T]>.error(NSError())
            }
            return Observable<[T]>.just(arrayObject)
        }
    }
}
