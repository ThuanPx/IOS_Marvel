//
//  BaseViewModel.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/19/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: NSObject {
    var activityIndicator = ActivityIndicator()
    var errorTracker = ErrorTracker()
}
