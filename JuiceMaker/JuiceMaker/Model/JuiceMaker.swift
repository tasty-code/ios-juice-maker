//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()

    func makeJuice(juiceName: JuiceName) {
        switch juiceName {
        case .strawberry:
            fruitStore.consumeFruit(fruitName: .strawberry, fruitQuantity: 16)
        case .banana:
            fruitStore.consumeFruit(fruitName: .banana, fruitQuantity: 2)
        case .kiwi:
            fruitStore.consumeFruit(fruitName: .kiwi, fruitQuantity: 3)
        case .pineapple:
            fruitStore.consumeFruit(fruitName: .pineapple, fruitQuantity: 2)
        case .straberryBanana:
            fruitStore.consumeFruit(fruitName: .strawberry, fruitQuantity: 10)
            fruitStore.consumeFruit(fruitName: .banana, fruitQuantity: 1)
        case .mango:
            fruitStore.consumeFruit(fruitName: .mango, fruitQuantity: 3)
        case .mangoKiwi:
            fruitStore.consumeFruit(fruitName: .mango, fruitQuantity: 2)
            fruitStore.consumeFruit(fruitName: .kiwi, fruitQuantity: 1)
        }
    }
}
