//
//  EachFruitStore.swift
//  JuiceMaker
//
//  Created by Effie on 12/4/23.
//

final class FruitStock {
    let fruitType: Fruit
    
    private var count: Int = 10
    
    init(fruitType: Fruit) {
        self.fruitType = fruitType
    }
    
    func consumeFruits(count: Int) throws {
        guard self.count >= count else { throw JuiceMakerError.fruitShortage }
        self.count -= count
    }
}
