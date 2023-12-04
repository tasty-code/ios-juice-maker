//
//  EachFruitStore.swift
//  JuiceMaker
//
//  Created by Effie on 12/4/23.
//

class EachFruitStore {
    let fruitType: Fruits
    
    private var count: Int = 10
    
    init(fruitType: Fruits) {
        self.fruitType = fruitType
    }
    
    func takeFruits(count: Int) throws {
        guard self.count >= count else { throw JuiceMakerError.fruitShortage }
        self.count -= count
    }
}

extension EachFruitStore: Hashable {
    static func == (lhs: EachFruitStore, rhs: EachFruitStore) -> Bool {
        lhs.fruitType == rhs.fruitType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.fruitType)
    }
}
