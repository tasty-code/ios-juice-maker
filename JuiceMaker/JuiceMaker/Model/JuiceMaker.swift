//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .kiwi:
            return "키위쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .strawberryBanana:
            return "딸바쥬스"
        case .mango:
            return "망고 쥬스"
        case .mangoKiwi:
            return "망고키위 쥬스"
        }
    }
    
    var needFruitQuantity: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [ .strawberry: 16 ]
        case .banana:
            return [ .banana: 2 ]
        case .kiwi:
            return [ .kiwi: 3 ]
        case .pineapple:
            return [ .pineapple: 2 ]
        case .strawberryBanana:
            return [ .strawberry: 10, .banana: 1 ]
        case .mango:
            return [ .mango: 3 ]
        case .mangoKiwi:
            return [ .mango: 2, .kiwi: 1 ]
        }
    }
    
}

enum Text {
    static let noFruit = "재료의 재고가 부족합니다."
    static let makeComplet = "나왔습니다~!"
}

struct JuiceMaker {
    let fruitStore = FruitStore()

    init () {}
    
    private func canMakeJuice(of juice: Juice) -> Bool {
        let minFluteQuantity = juice.needFruitQuantity.map {
            return (try? fruitStore.getQuantity(of: $0.key) - $0.value) ?? -1
        }.min() ?? 0
        
        return minFluteQuantity >= 0
    }
    
    func makeJuice(of juice: Juice) -> String {
        if canMakeJuice(of: juice) {
            juice.needFruitQuantity.forEach {
                fruitStore.setQuantity(of: $0.key, at: try! fruitStore.getQuantity(of: $0.key) - $0.value)
            }
            return juice.name + Text.makeComplet
        } else {
            return Text.noFruit
        }
    }
}
