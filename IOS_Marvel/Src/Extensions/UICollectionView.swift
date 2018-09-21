//
//  UICollectionView.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/21/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: type.className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func registerReusableView<T: UICollectionReusableView>(_ type: T.Type, kind: String) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func dequeueCell<T: UICollectionViewCell>(_ type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(_ kind: String, type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: type.className,
                                                for: indexPath) as! T
    }
}
