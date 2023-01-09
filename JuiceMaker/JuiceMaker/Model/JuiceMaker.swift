//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func makeJuice(by message: [OrderMessage]) {
        message.forEach {
            FruitStore.shared.changeStock(of: $0.fruitName, by: $0.amount)
        }
    }
}
