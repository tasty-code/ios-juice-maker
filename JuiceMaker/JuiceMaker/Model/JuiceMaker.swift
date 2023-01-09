//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var isEnoughIngredient = false
    
    func makeJuice(by message: [OrderMessage]) {
        do {
            try FruitStore.shared.checkStock(message: message)
            message.forEach {
                FruitStore.shared.changeStock(of: $0.fruitName, by: $0.amount)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
