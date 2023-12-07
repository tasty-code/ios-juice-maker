//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    var juiceList: [JuiceData] = [
        JuiceData(name: .strawberryJuice, quantity: 0),
        JuiceData(name: .bananaJuice, quantity: 0),
        JuiceData(name: .pineappleJuice, quantity: 0),
        JuiceData(name: .kiwiJuice, quantity: 0),
        JuiceData(name: .mangoJuice, quantity: 0),
        JuiceData(name: .strawberryBananaJuice, quantity: 0),
        JuiceData(name: .mangoKiwiKJuice, quantity: 0)
    ]
    
    func makeJuice(juice: JuiceType) -> Bool {
        switch juice {
            
        case .strawberryJuice:
            if fruitStore.checkFruitsQuantity(fruit: .strawberry, usedQuantity: 16) {
                return true
            }
        case .bananaJuice:
            if fruitStore.checkFruitsQuantity(fruit: .banana, usedQuantity: 2) {
                return true
            }
        case .pineappleJuice:
            if fruitStore.checkFruitsQuantity(fruit: .pineapple, usedQuantity: 2) {
                return true
            }
        case .kiwiJuice:
            if fruitStore.checkFruitsQuantity(fruit: .kiwi, usedQuantity: 3) {
                return true
            }
        case .mangoJuice:
            if fruitStore.checkFruitsQuantity(fruit: .mango, usedQuantity: 3) {
                return true
            }
        case .strawberryBananaJuice:
            if fruitStore.checkFruitsQuantity(fruit: .strawberry, usedQuantity: 10),
               fruitStore.checkFruitsQuantity(fruit: .banana, usedQuantity: 1) {
                return true
            }
        case .mangoKiwiKJuice:
            if fruitStore.checkFruitsQuantity(fruit: .mango, usedQuantity: 2),
               fruitStore.checkFruitsQuantity(fruit: .kiwi, usedQuantity: 1) {
                return true
            }
        }
        return false
    }
    
    func showJuiceQuantity(juice: JuiceType) -> String {
        if let index = juiceList.firstIndex(where: { $0.name == juice }) {
            return String(juiceList[index].quantity)
        }
        return String(0)
    }
}

