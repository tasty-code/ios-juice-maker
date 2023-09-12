//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    // Properties
    private var inventory: [FruitType: Int] = [
        .strawberry: 10, .banana: 10, .kiwi: 10, .pineapple: 10, .mango: 10
    ]
    
    func receiveOrder(juiceName: String) throws {
        // 쥬스 이름을 가지고 어떤 쥬스인지 확인, 그런 쥬스가 있으면 그 쥬스의 레시피를 확인
        guard let juice = JuiceType(rawValue: juiceName) else { throw JuiceMakerError.invalidSelection }
        let recipe = juice.recipe
        
        // 레시피 대로 재고 확인
        for ingredient in recipe {
            try validateStock(with: ingredient)
        }
        
        // 이상 없으면 재고 감산
        for ingredient in recipe {
            try updateInventoryStock(with: ingredient)
        }
    }
}

// MARK: Nested Types
extension FruitStore {
    @frozen enum JuiceType: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBananaMixJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangokiwiJuice = "망키쥬스"
        
        var recipe: [Fruit] {
            switch self {
            case .strawberryJuice: return [Fruit(.strawberry, 16)]
            case .bananaJuice: return [Fruit(.banana, 2)]
            case .kiwiJuice: return [Fruit(.kiwi, 3)]
            case .pineappleJuice: return [Fruit(.pineapple, 2)]
            case .strawberryBananaMixJuice: return [Fruit(.strawberry, 10), Fruit(.banana, 1)]
            case .mangoJuice: return [Fruit(.mango, 3)]
            case .mangokiwiJuice: return [Fruit(.mango, 2), Fruit(.kiwi, 1)]
            }
        }
    }
    
    @frozen enum FruitType: CaseIterable {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    struct Fruit {
        let fruitType: FruitType
        let quantity: Int
        
        init(_ fruitType: FruitType, _ quantity: Int) {
            self.fruitType = fruitType
            self.quantity = quantity
        }
    }
}

// MARK: Private Methods
extension FruitStore {
    // 현재 재고 확인, 요구 수량을 빼고도 0 이상이면 통과, 아니면 outOfStock 에러 전파
    private func validateStock(with fruit: Fruit) throws {
        guard let stock = self.inventory[fruit.fruitType], stock - fruit.quantity >= 0 else { throw JuiceMakerError.outOfStock }
    }
    
    // 지정된 요구 수량 만큼 빼고 변경된 값으로 재고 갱신
    private func updateInventoryStock(with fruit: Fruit) throws {
        guard let stock = self.inventory[fruit.fruitType] else { throw JuiceMakerError.invalidSelection }
        let remainStock = stock - fruit.quantity
        self.inventory[fruit.fruitType] = remainStock
    }
    
    // 원하는 값으로 해당 재료의 재고 갱신
    private func updateInventoryStock(with fruit: Fruit, _ quantity: Int = 1) throws {
        guard let stock = self.inventory[fruit.fruitType] else { throw JuiceMakerError.invalidSelection }
        let newStock = stock + quantity
        self.inventory[fruit.fruitType] = newStock
    }
}
