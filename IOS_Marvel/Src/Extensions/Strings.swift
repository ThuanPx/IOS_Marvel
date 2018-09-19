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
    func md5() -> String! {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLength)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        
        for i in 0..<digestLength {
            hash.appendFormat("%02x", result[i])
        }
        
        return String(format: hash as String)
    }
}
