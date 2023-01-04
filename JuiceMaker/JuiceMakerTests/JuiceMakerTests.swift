//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by jun on 2023/01/04.
//

import XCTest

final class JuiceMakerTests: XCTestCase {
    func test초기재고() {
        let stock: UInt = 10
        let fruitStore = FruitStore()
        XCTAssertEqual(fruitStore.stockByFruit, [.strawberry: stock, .banana: stock, .pineapple: stock, .kiwi: stock, .mango: stock])
    }
    
    func test정상적인재고사용() {
        let stock: UInt = 10
        let fruitStore = FruitStore()
        let quantity: UInt = 5
        fruitStore.subtractStock(fruitType: .banana, quantity: quantity)
        XCTAssertEqual(fruitStore.stockByFruit, [.strawberry: stock, .banana: stock - quantity, .pineapple: stock, .kiwi: stock, .mango: stock])
    }
    
    func test재고부족() {
        let stock: UInt = 10
        let fruitStore = FruitStore()
        let quantity: UInt = 15
        fruitStore.subtractStock(fruitType: .banana, quantity: quantity)
        XCTAssertEqual(fruitStore.stockByFruit, [.strawberry: stock, .banana: stock, .pineapple: stock, .kiwi: stock, .mango: stock])
    }
}
