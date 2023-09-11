//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()

    func make(juice: JuiceType) {
        fruitStore.update(fruits: juice.ingredients, as: -)
    }


}
