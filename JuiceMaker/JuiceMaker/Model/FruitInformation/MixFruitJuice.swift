//
//  FruitMixJuice.swift
//  JuiceMaker
//
//  Created by 이상윤 on 2023/01/06.
//

import Foundation

enum MixFruitJuice: CaseIterable {
    case strawberryAndBanana
    case mangoAndKiwi
    
    var recipe: [FruitList: Int] {
        switch self{
        case .strawberryAndBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoAndKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
