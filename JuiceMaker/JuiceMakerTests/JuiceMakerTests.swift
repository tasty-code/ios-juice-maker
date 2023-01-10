//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 조용현 on 2023/01/02.
//

import XCTest
@testable import JuiceMaker

final class JuiceMakerTests: XCTestCase {
    var JMsut: JuiceMaker<FruitStore>!
    var FSsut: FruitStore!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let defaultStock = Fruit.allCases.reduce(into: [:]) { partialResult, fruit in
            partialResult[fruit] = 10
        }
        FSsut = FruitStore(pairOfItems: defaultStock)
        JMsut = JuiceMaker(fruitStore: FSsut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        FSsut = nil
        JMsut = nil
    }
    
    func testFruitStore_더하기() {
        FSsut.add(item: .mango, count: 8)
        XCTAssertEqual(FSsut.items[.mango]!, 18)
    }
    
    func testFruitStore_빼기() {
        try? FSsut.subtract(pairOfItems: [.mango: 3])
        XCTAssertEqual(FSsut.items[.mango]!, 7)
    }
    
    func testFruitStore_빼기오류() {
        XCTAssertThrowsError(try FSsut.subtract(pairOfItems: [.mango: 13]))
    }

    func test_제조불가_JuiceMaker() {
        XCTAssertThrowsError(try JMsut.make(juice: .strawberryJuice))
    }

    func test_제조가능_JuiceMaker() {
        XCTAssertNoThrow(try JMsut.make(juice: .bananaJuice))
    }
}
