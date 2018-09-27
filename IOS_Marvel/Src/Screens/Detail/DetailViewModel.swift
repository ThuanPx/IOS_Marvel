//
//  DetailViewModel.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/24/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class DetailViewModel: BaseViewModel{
    
    private let navigator: DetailNavigator
    private let heroVariable: Variable<Hero>
    
    init(navigator: DetailNavigator, hero: Hero) {
        self.navigator = navigator
        self.heroVariable = Variable(hero)
    }
}

extension DetailViewModel: ViewModelProtocol {
    
    struct Input {
    }
    
    struct Output {
        let hero: Driver<Hero>
    }
    
    func transform(input: DetailViewModel.Input, with bag: DisposeBag) -> DetailViewModel.Output {
        let hero = heroVariable.asDriver()
        return Output(hero: hero)
    }

}
