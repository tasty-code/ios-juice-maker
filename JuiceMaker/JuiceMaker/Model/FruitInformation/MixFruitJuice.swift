//
//  FruitMixJuice.swift
//  JuiceMaker
//
//  Created by 이상윤 on 2023/01/06.
//

import Foundation

enum MixFruitJuice: CaseIterable {
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self{
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
