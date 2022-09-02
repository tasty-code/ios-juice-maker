//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit



// 쥬스 메이커 타입
struct JuiceMaker {
    
    enum FruitJuice {
        case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawbananaJuice, mankiJuice
        
        var name: String {
            switch self {
            case .strawberryJuice:
                return "딸기주스"
            case .bananaJuice:
                return "바나나주스"
            case .pineappleJuice:
                return "파인애플주스"
            case .kiwiJuice:
                return "키위주스"
            case .mangoJuice:
                return "망고주스"
            case .strawbananaJuice:
                return "딸바주스"
            case .mankiJuice:
                return "망키주스"
            }
        }
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .mangoJuice:
                return [.mango: 3]
            case .strawbananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mankiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    
}
