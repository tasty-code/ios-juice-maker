//
//  EachFruitStore.swift
//  JuiceMaker
//
//  Created by Effie on 12/4/23.
//

struct FruitStock {
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
}
