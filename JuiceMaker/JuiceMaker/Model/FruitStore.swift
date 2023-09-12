//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


final class FruitStore {
    
    // MARK: - Properties
    
    var fruitNames: [FruitJuice] = [.strawberry, .banana, .pineapple, .kiwi, .mango]
    var fruitDictionary: [FruitJuice: Int] = [:]
    
    init() {
        fillFruitStock()
    }
    
    // MARK: - Methods
    
    private func fillFruitStock() {
        for name in fruitNames {
            fruitDictionary[name] = .defaultStock
        }
    }
    
    func makeJuice(of name: FruitJuice) {
        do {
            switch name {
            case .strawberry:
                try checkJuiceStock(name, necessaryCount: 13)
            case .banana:
                try checkJuiceStock(name, necessaryCount: 2)
            case .pineapple:
                try checkJuiceStock(name, necessaryCount: 2)
            case .kiwi:
                try checkJuiceStock(name, necessaryCount: 3)
            case .mango:
                try checkJuiceStock(name, necessaryCount: 3)
            case .strawberryBanana:
                try checkJuiceStock(.strawberry, necessaryCount: 10)
                try checkJuiceStock(.banana, necessaryCount: 1)
            case .mangoKiwi:
                try checkJuiceStock(.mango, necessaryCount: 2)
                try checkJuiceStock(.kiwi, necessaryCount: 1)
            }
            print("\(name)쥬스를 만들었습니다.")
        } catch {
            print("\(name)쥬스를 만들기 위한 \(error)")
        }
    }
    
    func checkJuiceStock(_ name: FruitJuice, necessaryCount: Int) throws {
        if fruitDictionary[name, default: .defaultStock] < necessaryCount {
            throw StockError.emptyStock
        }
        fruitDictionary[name, default: .defaultStock] -= necessaryCount
    }
}
