//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고 쥬스"
    case mangoKiwiJuice = "망고키위 쥬스"
    
    static let dictionary: [String: Juice] = [
        strawberryJuice.rawValue: strawberryJuice,
        bananaJuice.rawValue: bananaJuice,
        kiwiJuice.rawValue: kiwiJuice,
        pineappleJuice.rawValue: pineappleJuice,
        strawberryBananaJuice.rawValue: strawberryBananaJuice,
        mangoJuice.rawValue: mangoJuice,
        mangoKiwiJuice.rawValue: mangoKiwiJuice,
    ]
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
