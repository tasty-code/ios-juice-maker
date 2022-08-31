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
}

enum Text {
    static let noJuice = "쥬스가 존재하지 않습니다."
    static let noFruit = "재료의 재고가 부족합니다."
    static let makeComplet = "나왔습니다~!"
}

struct JuiceMaker {
    let needFruitQuantity: [Juice: [Fruit: Int]] = [
        .strawberryJuice: [
            .strawberry: 16
        ],
        .bananaJuice: [
            .banana: 2
        ],
        .kiwiJuice: [
            .kiwi: 3
        ],
        .pineappleJuice: [
            .pineapple: 2
        ],
        .strawberryBananaJuice: [
            .strawberry: 10,
            .banana: 1
        ],
        .mangoJuice: [
            .mango: 3
        ],
        .mangoKiwiJuice: [
            .mango: 2,
            .kiwi: 1
        ],
    ]
    let fruitStore = FruitStore()

    init () {}
    
    private func canMakeJuice(of: Juice) -> Bool {
        let minFluteQuantity = needFruitQuantity[of]?.map {
            return (try? fruitStore.getQuantity(of: $0.key) - $0.value) ?? -1
        }.min() ?? 0
        
        return minFluteQuantity >= 0
    }
    
    func makeJuice(name: String) -> String {
        if let juice = Juice.dictionary[name] {
            if canMakeJuice(of: juice) {
                needFruitQuantity[juice]?.forEach {
                    fruitStore.setQuantity(of: $0.key, at: try! fruitStore.getQuantity(of: $0.key) - $0.value)
                }
                return name + Text.makeComplet
            } else {
                return Text.noFruit
            }
        } else {
            return Text.noJuice
        }
    }
}
