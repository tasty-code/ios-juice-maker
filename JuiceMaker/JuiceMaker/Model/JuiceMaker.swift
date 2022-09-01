//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .kiwi:
            return "키위쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .strawberryBanana:
            return "딸바쥬스"
        case .mango:
            return "망고 쥬스"
        case .mangoKiwi:
            return "망고키위 쥬스"
        }
    }
    
    var needFruitQuantity: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [ .strawberry: 16 ]
        case .banana:
            return [ .banana: 2 ]
        case .kiwi:
            return [ .kiwi: 3 ]
        case .pineapple:
            return [ .pineapple: 2 ]
        case .strawberryBanana:
            return [ .strawberry: 10, .banana: 1 ]
        case .mango:
            return [ .mango: 3 ]
        case .mangoKiwi:
            return [ .mango: 2, .kiwi: 1 ]
        }
    }
    
}

enum Text {
    static let noneFruit = "없는 과일입니다."
    static let lackOfFruit = "재료가 모자라요. 재고를 수정할까요?"
    static let makeComplet = " 나왔습니다! 맛있게 드세요!"
}

enum MakeJuiceStatus {
    case noneFruit
    case lackOfFruit
    case makeComplet
}

struct MakeJuice {
    var status: MakeJuiceStatus
    var message: String
}

class JuiceMaker: FruitStore {
    private func canMakeJuice(of juice: Juice) -> Bool {
        let minFluteQuantity = juice.needFruitQuantity.map {
            return (try? self.getQuantity(of: $0.key) - $0.value) ?? -1
        }.min() ?? 0
        
        return minFluteQuantity >= 0
    }
    
    func makeJuice(of juice: Juice) -> MakeJuice {
        if canMakeJuice(of: juice) {
            for value in juice.needFruitQuantity {
                do {
                    self.setQuantity(of: value.key, at: try self.getQuantity(of: value.key) - value.value)
                } catch {
                    return MakeJuice(status: .noneFruit, message: Text.noneFruit)
                }
            }
            return MakeJuice(status: .makeComplet, message: juice.name + Text.makeComplet)
        } else {
            return MakeJuice(status: .lackOfFruit, message: Text.lackOfFruit)
        }
    }
}
