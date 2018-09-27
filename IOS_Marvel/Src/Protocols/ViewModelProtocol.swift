//
//  ViewModelProtocol.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/21/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    func transform(input: Input,with bag: DisposeBag) -> Output
}
