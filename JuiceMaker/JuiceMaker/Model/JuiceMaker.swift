//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore.shared
    
    enum JuiceType: String {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    func order() {
        print("주문해주세요.")
        guard let fruitOrder = readLine() else { return }
    }
    
    func makeJuice(type: JuiceType) {
        switch type {
        case .strawberry:
            break
        case .banana:
            break
        case .kiwi:
            break
        case .pineapple:
            break
        case .strawberryBanana:
            break
        case .mango:
            break
        case .mangoKiwi:
            break
        default:
            break
        }
    }
}
