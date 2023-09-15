//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func make(juice: JuiceType) throws {
        try FruitStore.shared.update(fruits: juice.ingredients, as: -)
    }

    func update(_ fruit: Fruit) throws {
        try FruitStore.shared.update(fruit, as: +)
    }
}
