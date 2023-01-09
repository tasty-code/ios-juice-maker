//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    func makeJuice(by message: [OrderMessage]) {
        message.forEach {
            FruitStore.shared.decreaseStock(of: $0.fruitName, by: $0.amount)
        }
    }
}
