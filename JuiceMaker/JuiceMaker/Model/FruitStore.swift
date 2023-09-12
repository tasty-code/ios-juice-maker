//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Fruit = (fruitType: FruitType, quantity: Int)

@frozen enum JuiceType {
    case strawberryJuice, strawberryBananaMixJuice
}

@frozen enum FruitType {
    case strawberry, banana
}

final class FruitStore {
    // Fruits Properties
    private var strawberry: Int = 10
    private var banana: Int = 10
    
    // 주문 받은 것대로 재고 빼기
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice:
            makeJuice(firstIngredientCount: 16)
        case .strawberryBananaMixJuice:
            makeJuice(firstIngredientCount: 10, secondIngredientCount: 1)
        }
    }
    
    
}

// MARK: Private methods
extension FruitStore {
    private func makeJuice(firstIngredientCount: Int) {
        
    }
    
    private func makeJuice(firstIngredientCount: Int, secondIngredientCount: Int) {
        
    }
}
