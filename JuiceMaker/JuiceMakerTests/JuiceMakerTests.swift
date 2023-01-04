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
}
