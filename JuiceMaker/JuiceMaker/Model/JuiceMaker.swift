//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case 딸기쥬스
    case 바나나쥬스
    case 키위쥬스
    case 파인애플_쥬스 = "파인애플 쥬스"
    case 딸바쥬스
    case 망고_쥬스 = "망고 쥬스"
    case 망고키위_쥬스 = "망고키위 쥬스"
    
    static let dictionary: [String: Juice] = [
        딸기쥬스.rawValue: 딸기쥬스,
        바나나쥬스.rawValue: 바나나쥬스,
        키위쥬스.rawValue: 키위쥬스,
        파인애플_쥬스.rawValue: 파인애플_쥬스,
        딸바쥬스.rawValue: 딸바쥬스,
        망고_쥬스.rawValue: 망고_쥬스,
        망고키위_쥬스.rawValue: 망고키위_쥬스,
    ]
}
enum Text {
    static let noJuice = "쥬스가 존재하지 않습니다."
    static let noFruit = "재료의 재고가 부족합니다."
    static let makeComplet = "나왔습니다~!"
}

struct JuiceMaker {
    let needFruitQuantity: [Juice: [Fruit: Int]] = [
        .딸기쥬스: [
            .strawberry: 16
        ],
        .바나나쥬스: [
            .banana: 2
        ],
        .키위쥬스: [
            .kiwi: 3
        ],
        .파인애플_쥬스: [
            .pineapple: 2
        ],
        .딸바쥬스: [
            .strawberry: 10,
            .banana: 1
        ],
        .망고_쥬스: [
            .mango: 3
        ],
        .망고키위_쥬스: [
            .mango: 2,
            .kiwi: 1
        ],
    ]
    let fruitStore = FruitStore()

    init () {}
    
    private func canMakeJuice(of: Juice) -> Bool {
        let minFluteQuantity = needFruitQuantity[of]?.map {
            return (try? fruitStore.getFruitQuantity(of: $0.key) - $0.value) ?? -1
        }.min() ?? 0
        
        return minFluteQuantity >= 0
    }
    
    func makeJuice(name: String) -> String {
        if let juice = Juice.dictionary[name] {
            if canMakeJuice(of: juice) {
                needFruitQuantity[juice]?.forEach {
                    fruitStore.setFruit(of: $0.key, quantity: try! fruitStore.getFruitQuantity(of: $0.key) - $0.value)
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
