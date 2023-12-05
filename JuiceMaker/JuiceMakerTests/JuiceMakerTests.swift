//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 미르 & 미성
//

import XCTest
@testable import JuiceMaker

final class JuiceMakerTests: XCTestCase {
    var sut: JuiceMaker!

    override func setUpWithError() throws {
        sut = JuiceMaker()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_딸기쥬스는_재고가없다() {
        let input: Juice = .strawberryJuice
        let expectation = false
        
        let result = sut.fruitStore.consumeFruit(juice: input)
        
        XCTAssertEqual(result, expectation)
    }
}
