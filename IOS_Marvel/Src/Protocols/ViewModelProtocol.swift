//
//  ViewModelProtocol.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/21/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
