//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var eachFruits: Set<EachFruitStore>
    
    init() {
        let newFruits = Fruits.allCases.map { fruit in
            EachFruitStore(fruitType: fruit)
        }
        self.eachFruits = Set(newFruits)
    }
}

enum Fruits: CaseIterable {
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

enum JuiceFlavor {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberry: 
            return [.strawberry: 16]
        case .banana: 
            return [.banana: 2]
        case .pineapple: 
            return [.pineapple: 2]
        case .kiwi: 
            return [.kiwi: 3]
        case .mango: 
            return [.mango: 3]
        case .strawberryBanana: 
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi: 
            return [.mango: 2, .kiwi: 1]
        }
    }
}
