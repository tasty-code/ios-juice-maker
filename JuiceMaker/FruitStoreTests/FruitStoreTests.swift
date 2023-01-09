//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by 김용재 on 2023/01/09.
//

import XCTest
@testable import JuiceMaker

final class FruitStoreTests: XCTestCase {
    

    override func setUpWithError() throws {
        Fruit.allCases.forEach { fruit in
            FruitStore.shared.setStock(of: fruit, to: 10)
        }
    }
    
    func test_망고_재고를_10만큼_변경했을때_재고가_20이된다() throws {
        try FruitStore.shared.changeStock(of: .mango, by: 10)
        

        let result = FruitStore.shared.stock[.mango]!
        let expectation = 30
        
        XCTAssertEqual(result, expectation)
    }
}
