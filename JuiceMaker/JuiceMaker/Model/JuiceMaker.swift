//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

// 쥬스 메이커 타입
struct JuiceMaker {
    static var shared: JuiceMaker = JuiceMaker()
    
    private init() {}
    
    var juiceList: [JuiceInfo] = [
        JuiceInfo(name: .strawberryJuice, quantity: 0),
        JuiceInfo(name: .bananaJuice, quantity: 0),
        JuiceInfo(name: .pineappleJuice, quantity: 0),
        JuiceInfo(name: .kiwiJuice, quantity: 0),
        JuiceInfo(name: .mangoJuice, quantity: 0),
        JuiceInfo(name: .strawberryBananaJuice, quantity: 0),
        JuiceInfo(name: .mangoKiwiJuice, quantity: 0)
    ]
    
    mutating func isJuiceAvailable(juice: Juice) -> Bool {
        switch juice {
        case .strawberryJuice:
            return validationCheckAndUsedFruit(fruit: .strawberry, quantity: 16) ? addJuiceQuantity(juice: juice) : false
        case .bananaJuice:
            return validationCheckAndUsedFruit(fruit: .banana, quantity: 2) ? addJuiceQuantity(juice: juice) : false
        case .pineappleJuice:
            return validationCheckAndUsedFruit(fruit: .pineapple, quantity: 2) ? addJuiceQuantity(juice: juice) : false
        case .kiwiJuice:
            return validationCheckAndUsedFruit(fruit: .kiwi, quantity: 3) ? addJuiceQuantity(juice: juice) : false
        case .mangoJuice:
            return validationCheckAndUsedFruit(fruit: .mango, quantity: 3) ? addJuiceQuantity(juice: juice) : false
        case .strawberryBananaJuice:
            return validationCheckAndUsedFruit(fruit: .strawberry, quantity: 10) && validationCheckAndUsedFruit(fruit: .banana, quantity: 1) ? addJuiceQuantity(juice: juice) : false
        case .mangoKiwiJuice:
            return validationCheckAndUsedFruit(fruit: .mango, quantity: 2) && validationCheckAndUsedFruit(fruit: .kiwi, quantity: 1) ?
                addJuiceQuantity(juice: juice) : false
        }
    }
    
    private func validationCheckAndUsedFruit(fruit: Fruit, quantity: Int)  -> Bool{
        let fruitStore = FruitStore.shared
        if fruitStore.checkFruitsQuantity(fruit: fruit, willUseQuantity: quantity) {
            fruitStore.usedFruitsQuantity(fruit: fruit, usedQuantity: quantity)
            return true
        }
        return false
    }
    
    public func showJuiceQuantity(juice: Juice) -> String {
        if let index = juiceList.firstIndex(where: { $0.name == juice }) {
            return String(juiceList[index].quantity)
        }
        return String(0)
    }
    
    mutating public func addJuiceQuantity(juice: Juice) -> Bool {
        if let index = juiceList.firstIndex(where: { $0.name == juice }) {
            juiceList[index].quantity += 1
        }
        return true
    }
}

