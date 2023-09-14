//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


final class FruitStore {
    
    // MARK: - Properties
    
    private var fruitNames: [JuiceMenu] = [.strawberry, .banana, .pineapple, .kiwi, .mango]
    private(set) var fruitDictionary: [JuiceMenu: Int] = [:]
    
    // MARK: - Init
    
    init() {
        fillFruitStock()
    }
    
    // MARK: - Methods
    
    private func fillFruitStock() {
        for name in fruitNames {
            fruitDictionary[name] = .defaultStock
        }
    }
    
    func makeJuice(of name: JuiceMenu) {
        do {
            switch name {
            case .strawberry:
                try calculateJuiceStock(name, necessaryCount: 13)
            case .banana, .pineapple:
                try calculateJuiceStock(name, necessaryCount: 2)
            case .kiwi, .mango:
                try calculateJuiceStock(name, necessaryCount: 3)
            case .strawberryBanana:
                try calculateJuiceStock(.strawberry, necessaryCount: 10)
                try calculateJuiceStock(.banana, necessaryCount: 1)
            case .mangoKiwi:
                try calculateJuiceStock(.mango, necessaryCount: 2)
                try calculateJuiceStock(.kiwi, necessaryCount: 1)
            }
            print("\(name)쥬스를 만들었습니다.")
        } catch {
            debugPrint(name, error)
        }
    }
    
    func calculateJuiceStock(_ name: JuiceMenu, necessaryCount: Int) throws {
        try checkJuiceStock(of: name, necessaryCount: necessaryCount)

        fruitDictionary[name, default: .defaultStock] -= necessaryCount
    }

    private func checkJuiceStock(of name: JuiceMenu, necessaryCount: Int) throws {
        if fruitDictionary[name, default: .defaultStock] < necessaryCount {
            throw StockError.emptyStock
        }
    }
}
