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
        try super.setUpWithError()
        for fruit in Fruit.allCases {
            try FruitStore.shared.setStock(of: fruit, to: 10)
        }
    }
     
    func test_망고_재고를_10만큼_변경했을때_재고가_20이된다() throws {
        try FruitStore.shared.changeStock(of: .mango, by: 10)

        let result = FruitStore.shared.stock[.mango]!
        let expectation = 20
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_딸기_재고를_마이너스20만큼_변경했을때_에러가_발생한다() {
        XCTAssertThrowsError(try FruitStore.shared.changeStock(of: .strawberry, by: -20)) { error in
            XCTAssertEqual(error as? StockError, StockError.notEnoughToChange)
        }
    }
    
    func test_키위_재고를_음수로_설정했을때_에러가_발생한다() throws {
        XCTAssertThrowsError(try FruitStore.shared.setStock(of: .kiwi, to: -10))
    }
}
