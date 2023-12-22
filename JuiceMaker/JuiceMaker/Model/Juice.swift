//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 유니 & 이안 on 2023/12/06.
//

import Foundation

struct Juice: Hashable {
    let name: String
    let recipe: [Fruit: Int]
    
    init(name: String, recipe: [Fruit: Int]) {
        self.name = name
        self.recipe = recipe
    }
}

extension Juice {
    static let strawberryJuice = Juice(name: "딸기쥬스", recipe: [.strawberry: 16])
    static let bananaJuice = Juice(name: "바나나쥬스", recipe: [.banana: 2])
    static let kiwiJuice = Juice(name: "키위쥬스", recipe: [.kiwi: 3])
    static let pineappleJuice = Juice(name: "파인애플쥬스", recipe: [.pineapple: 2])
    static let mangoJuice = Juice(name: "망고쥬스", recipe: [.mango: 3])
    static let strawberryBananaJuice = Juice(name: "딸바쥬스", recipe: [.strawberry: 1, .banana: 10])
    static let mangoKiwiJuice = Juice(name: "망고키위쥬스", recipe: [.mango: 10, .kiwi: 1])
    
}
