//
//  AppError.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/21/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation

enum APIError: Error {
    case parserJsonError
    case apiFailure
}

extension APIError {
    var errorDescription: String?{
        switch self {
        case .parserJsonError:
            return "Parse json error"
        case .apiFailure:
            return "Api failure"
        }
    }
}
