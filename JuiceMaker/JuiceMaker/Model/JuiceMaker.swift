//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    func make(juice: JuiceType) throws {
        try fruitStore.update(fruits: juice.ingredients, as: +)
    }

    func add(fruit: Fruit) throws {
        try fruitStore.update(fruit, as: +)
    }

    func sub(fruit: Fruit) throws {
        try fruitStore.update(fruit, as: -)
    }
}
