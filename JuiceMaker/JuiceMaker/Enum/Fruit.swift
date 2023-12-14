//
//  FruitType.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/10.
//

import UIKit

enum Fruit: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    static var allCases: [Fruit] {
        return [
            .strawberry,
            .banana,
            .pineapple,
            .kiwi,
            .mango
        ]
    }
}
