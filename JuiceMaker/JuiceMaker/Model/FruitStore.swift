//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    // Fruits Properties
    private var fruitsStorage: [Fruit] = [
        Fruit(.strawberry, count: 10)
    ]
    
    // 주문 받은 것대로 재고 빼기
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice:
            updateInventory(.strawberry, count: -16)
        }
    }
}

// MARK: Nested Types
extension FruitStore {
    @frozen enum JuiceType {
        case strawberryJuice
        
        struct Juice {
            let firstIngredient: Fruit
            let secondIngredient: Fruit
            
            init(_ firstIngredient: Fruit, _ secondIngredient: Fruit) {
                self.firstIngredient = firstIngredient
                self.secondIngredient = secondIngredient
            }
        }
    }
    
    @frozen enum FruitType {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    struct Fruit {
        let fruitType: FruitType
        let count: Int
        
        init(_ fruitType: FruitType, count: Int) {
            self.fruitType = fruitType
            self.count = count
        }
        
        func updateInfo(newValue: Int) -> Fruit {
            return Fruit(fruitType, count: newValue)
        }
    }
}

// MARK: Private methods
extension FruitStore {
    // 재고 조정
    private func updateInventory(_ firstIngredient: Fruit, _ secondIngredient: Fruit?) {
        guard let firstFruit = fruitsStorage.filter( {$0.fruitType == firstIngredient.fruitType }).first else { return }
        
        if let secondFruit = fruitsStorage.filter( {$0.fruitType == secondIngredient?.fruitType }).first,
           let count = secondIngredient?.count {
            let remainStock: Int = secondFruit.count + count
            guard remainStock > 0 else { return }
            fruitsStorage.filter({ $0.fruitType == secondIngredient?.fruitType }).first = secondFruit.updateInfo(newValue: remainStock)
        }
        
        let remainStock: Int = firstFruit.count + firstIngredient.count
        guard remainStock > 0 else { return }
        fruitsStorage[fruitType] = remainStock
    }
}
