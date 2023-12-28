//
//  EachFruitStore.swift
//  JuiceMaker
//
//  Created by Effie on 12/4/23.
//

struct FruitStock {
    static let minimumStoctCount: Int = 0
    
    let fruitType: Fruit
    
    let count: Int
    
    init(fruitType: Fruit, count: Int) {
        self.fruitType = fruitType
        self.count = count
    }
    
    func fruitsConsumed(count: Int) throws -> FruitStock {
        guard self.count >= count else { throw JuiceMakerError.fruitShortage }
        let countAfterConsumtion = self.count - count
        return .init(fruitType: self.fruitType, count: countAfterConsumtion)
    }
    
    func updateCount(to newCount: Int) throws -> FruitStock {
        guard newCount >= Self.minimumStoctCount else { throw JuiceMakerError.invalidStockCount }
        return .init(fruitType: self.fruitType, count: newCount)
    }
}
