//
//  HeroViewModel.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HeroViewModel: BaseViewModel {
    
    private struct Constants {
        static let API_KEY = "4582ff7d7509676253b6bc474a0020fb"
        static let IMAGE_FORMAT = "/standard_xlarge.jpg"
        static let TS = 131710.0
        static let HASH_KEY = "76cab7d2f2f52b9fe5ea485122e62c38"
    }
    
    private let navigator: HeroNavigator
    private let heroes = Variable<[Hero]>([])
    
    init(navigator: HeroNavigator) {
        self.navigator = navigator
    }
}

extension HeroViewModel: ViewModelProtocol {
    
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
    }
    
    struct Output {
        let fetchHeroSucces: Driver<Void>
    }
    
    func transform(input: HeroViewModel.Input) -> HeroViewModel.Output {
        let fetchHero = input.viewWillAppearTrigger.flatMap({
            [unowned self] _ -> Driver<[Hero]> in
            return API.fetchHero(offset: 0, ts: Constants.TS, apiKey: Constants.API_KEY, hash: Constants.HASH_KEY)
            .trackError(self.errorTracker)
            .trackActivity(self.activityIndicator)
            .asDriverOnErrorJustComplete()
        }).do(onNext:{ heroes in
            self.heroes.value = heroes
        }).mapToVoid()
        
        return Output(fetchHeroSucces: fetchHero)
    }
    
    func itemCount() -> Int {
        return heroes.value.count
    }
    
    func hero(at index: Int) -> Hero {
        return heroes.value[index]
    }
   
}
