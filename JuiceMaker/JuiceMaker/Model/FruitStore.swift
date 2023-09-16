//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private var inventory: [FruitType: Int]
    
    init() {
        let initialQuantity: Int = 10
        
        var inventory: [FruitType: Int] = [:]
        
        for fruitType in FruitType.allCases {
            inventory[fruitType] = initialQuantity
        }
        
        self.inventory = inventory
    }
    
    func receiveOrder(juiceName: String) throws {
        guard let juice = JuiceType(rawValue: juiceName) else { throw JuiceMakerError.invalidSelection }
        let recipe = juice.recipe
        
        for ingredient in recipe {
            try validateStock(with: ingredient)
        }
        
        for ingredient in recipe {
            try updateInventoryStock(with: ingredient)
        }
    }
    
    func checkInventoryStock() -> [String: Int] {
        var itemDict: [String: Int] = [:]

        for item in self.inventory {
            itemDict[item.key.rawValue] = item.value
        }

        return itemDict
    }
    
    func updateInventoryStock(with inventory: [String: Int]) {
        for item in inventory {
            if let fruitType = FruitType(rawValue: item.key) {
                self.inventory.updateValue(item.value, forKey: fruitType)
            }
        }
    }
}

// MARK: Nested Types
extension FruitStore {
    private enum JuiceType: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBananaMixJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangoKiwiMixJuice = "망키쥬스"
        
        var recipe: [Fruit] {
            switch self {
            case .strawberryJuice: return [Fruit(.strawberry, 16)]
            case .bananaJuice: return [Fruit(.banana, 2)]
            case .kiwiJuice: return [Fruit(.kiwi, 3)]
            case .pineappleJuice: return [Fruit(.pineapple, 2)]
            case .strawberryBananaMixJuice: return [Fruit(.strawberry, 10), Fruit(.banana, 1)]
            case .mangoJuice: return [Fruit(.mango, 3)]
            case .mangoKiwiMixJuice: return [Fruit(.mango, 2), Fruit(.kiwi, 1)]
            }
        }
    }
    
    private enum FruitType: String, CaseIterable {
        case strawberry = "딸기"
        case banana = "바나나"
        case kiwi = "키위"
        case pineapple = "파인애플"
        case mango = "망고"
    }
    
    private struct Fruit {
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
    private func validateStock(with fruit: Fruit) throws {
        guard let stock = self.inventory[fruit.fruitType], stock - fruit.quantity >= 0 else { throw JuiceMakerError.outOfStock }
    }
    
    private func updateInventoryStock(with fruit: Fruit) throws {
        guard let stock = self.inventory[fruit.fruitType] else { throw JuiceMakerError.invalidSelection }
        let remainStock = stock - fruit.quantity
        self.inventory[fruit.fruitType] = remainStock
    }
}
