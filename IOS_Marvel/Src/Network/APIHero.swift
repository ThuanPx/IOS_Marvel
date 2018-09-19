//
//  APIHero.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import ObjectMapper

private struct Constants {
    struct APIKey {
        static let offset = "offset"
        static let ts = "ts"
        static let apiKey = "apikey"
        static let hash = "hash"
    }
}

enum APIHero: URLRequestConvertible, APIRequestProtocol {
    
    case fetchHero(offset: Int, ts: Double, apiKey: String, hash: String)
    
    var method: HTTPMethod{
        return .get
    }
    
    var path: String{
        return "/v1/public/characters?limit=20"
    }
    
    var header: Parameters?{
        return nil
    }
    
    var params: Parameters?{
        switch self {
        case .fetchHero(let offset, let ts, let apiKey, let hash):
            return [Constants.APIKey.offset: offset, Constants.APIKey.ts: ts
                    ,Constants.APIKey.apiKey: apiKey, Constants.APIKey.hash: hash]
        }
    }
    
    var body: Parameters?{
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        return self.createURLRequest
    }
}

extension API {
    class func fetchHero(offset: Int, ts: Double, apiKey: String, hash: String)-> Observable<[Hero]>{
        let request = APIHero.fetchHero(offset: offset, ts: ts, apiKey: apiKey, hash: hash)
        return API.request(request).flatMap({ (json) -> Observable<[Hero]> in
            guard let data = json["results"] as? [[String:Any]] else {
                return Observable.error(APIError.parserJsonError)
            }
            let list = Mapper<Hero>().mapArray(JSONArray: data)
            print("count test \(list.count) ")
            return Observable.just(list)
        })
        
    }
}
