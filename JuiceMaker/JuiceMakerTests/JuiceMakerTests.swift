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
        let count: UInt = 5
        XCTAssertNoThrow(try fruitStore.subtractStock(fruit: .banana, count: count))
        XCTAssertEqual(fruitStore.stockByFruit, [.strawberry: stock, .banana: stock - count, .pineapple: stock, .kiwi: stock, .mango: stock])
    }
    
    func test재고부족() {
        let stock: UInt = 10
        let fruitStore = FruitStore()
        let count: UInt = 15
        XCTAssertThrowsError(try fruitStore.subtractStock(fruit: .banana, count: count))
        XCTAssertEqual(fruitStore.stockByFruit, [.strawberry: stock, .banana: stock, .pineapple: stock, .kiwi: stock, .mango: stock])
    }
}
