//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var inventory: [FruitType: Int]
    
    init() {
        inventory = [.banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10, .strawberry: 10]
    }
    // 특정 과일의 재고을 업데이트 하는 메서드
    func updateInventory(fruit: FruitType, quantity: Int) {
        guard let currentQuantity = inventory[fruit] else { return }
        inventory[fruit] = currentQuantity + quantity
    }
    // 특정 과일의 현재 재고 수량을 반환하는 메서드
    func getQuantity(of fruit: FruitType) -> Int {
        return inventory[fruit, default: 0]
    }
}
