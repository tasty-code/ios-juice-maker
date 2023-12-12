//
//  FruitType.swift
//  JuiceMaker
//
//  Created by 유니 & 이안 on 2023/12/06.
//

import Foundation

struct Fruit: Hashable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Fruit {
    static let strawberry = Fruit(name: "딸기")
    static let banana = Fruit(name: "바나나")
    static let kiwi = Fruit(name: "키위")
    static let pineapple = Fruit(name: "파인애플")
    static let mango = Fruit(name: "망고")
}
