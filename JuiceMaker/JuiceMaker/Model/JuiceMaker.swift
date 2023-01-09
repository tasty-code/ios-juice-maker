//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared

    func order(juice: Menu) -> Bool {
        do {
            try make(juice: juice)
        } catch {
            print(error.localizedDescription)
            return false
        }
        return true
    }

    func make(juice order: Menu) throws {
        try fruitStore.remove(according: order.recipe)
    }
}
