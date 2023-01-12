//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    weak var juiceAlertDelegate: JuiceAlertDelegate?

    func order(juice: Menu) {
        do {
            try make(juice: juice)
            juiceAlertDelegate?.madeJuiceAlert(juice: juice)
        } catch {
            juiceAlertDelegate?.shortOfStockAlert(message: error.localizedDescription)
        }
    }

    func make(juice order: Menu) throws {
        try fruitStore.remove(according: order.recipe)
    }
}
