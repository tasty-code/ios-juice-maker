//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    // Fruits Properties
    private var fruitsStorage: [FruitType:Int] = [
        .strawberry : 10, .banana : 10, .kiwi : 10, .pineapple : 10, .mango : 10
    ]
    
    // 주문 받은 것대로 재고 빼기
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice: break
        }
    }
}

// MARK: Nested Types
extension FruitStore {
    @frozen enum JuiceType {
        case strawberryJuice
//        case bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaMixJuice, mangoJuice, mangoKiwiMixJuice
    }
    
    @frozen enum FruitType {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    struct Fruit {
        let fruitType: FruitType
        let quantity: Int
    }
}

// MARK: Private methods
extension FruitStore {
    private func checkQuantity(_ firstIngredient: Fruit, _ secondIngredient: Fruit) throws {
        
    }
    
    private func updateInventory(_ fruitType: FruitType, count: Int) {
        
    }
}
