//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .pineappleJuice:
                return "파인애플 쥬스"
            case .strawberryBananaJuice:
                return "딸바쥬스"
            case .mangoJuice:
                return "망고 쥬스"
            case .mangoKiwiJuice:
                return "망고키위 쥬스"
        }
    }
    var needFruitQuantity: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [ .strawberry: 16 ]
        case .bananaJuice:
            return [ .banana: 2 ]
        case .kiwiJuice:
            return [ .kiwi: 3 ]
        case .pineappleJuice:
            return [ .pineapple: 2 ]
        case .strawberryBananaJuice:
            return [ .strawberry: 10, .banana: 1 ]
        case .mangoJuice:
            return [ .mango: 3 ]
        case .mangoKiwiJuice:
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
    
    private func canMakeJuice(of: Juice) -> Bool {
        let minFluteQuantity = of.needFruitQuantity.map {
            return (try? fruitStore.getQuantity(of: $0.key) - $0.value) ?? -1
        }.min() ?? 0
        
        return minFluteQuantity >= 0
    }
    
    func makeJuice(of: Juice) -> String {
        if canMakeJuice(of: of) {
            of.needFruitQuantity.forEach {
                fruitStore.setQuantity(of: $0.key, at: try! fruitStore.getQuantity(of: $0.key) - $0.value)
            }
            return of.name + Text.makeComplet
        } else {
            return Text.noFruit
        }
    }
}
