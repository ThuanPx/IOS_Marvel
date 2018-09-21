//
//  Strings.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/14/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import CommonCrypto
extension Optional where Wrapped == String {
    func isWhiteSpaceOrEmpty() -> Bool {
        return self?.trimmingCharacters(in: .whitespaces).isEmpty ?? true
    }
}

extension String {
    
    var localized: String {
        let localized = NSLocalizedString(self, comment: "")
        if !localized.isEmpty {
            return localized
        } else {
            return self
        }
    }
}
