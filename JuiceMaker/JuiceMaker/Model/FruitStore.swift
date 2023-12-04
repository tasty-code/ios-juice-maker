//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
}

enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

struct EachFruitStore {
    private let fruitType: Fruits
    
    private var count: Int = 10
    
    init(fruitType: Fruits) {
        self.fruitType = fruitType
    }
    
    mutating func takeFruits(count: Int) throws {
        guard self.count >= count else { throw JuiceMakerError.fruitShortage }
        self.count -= count
    }
}

extension EachFruitStore: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.fruitType)
    }
}

enum JuiceMakerError: Error {
    case fruitShortage
}
