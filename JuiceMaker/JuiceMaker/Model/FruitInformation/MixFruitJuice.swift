//
//  FruitMixJuice.swift
//  JuiceMaker
//
//  Created by 이상윤 on 2023/01/06.
//

import Foundation

enum MixFruitJuice: String, CaseIterable, CustomStringConvertible {
    case strawberryBanana = "딸바쥬스 주문"
    case mangoKiwi = "망키쥬스 주문"
    
    var recipe: [Fruit: Int] {
        switch self{
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var description: String {
        return self.rawValue
    }
}
