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

    func add(fruitType: FruitType) throws {
        try FruitStore.shared.update(Fruit(fruitType, 1), as: +)
    }

    func sub(fruitType: FruitType) throws {
        try FruitStore.shared.update(Fruit(fruitType, 1), as: -)
    }
}
