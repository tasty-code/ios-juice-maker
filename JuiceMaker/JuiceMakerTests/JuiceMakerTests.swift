//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 조용현 on 2023/01/02.
//

import XCTest
@testable import JuiceMaker

final class JuiceMakerTests: XCTestCase {
    
    var sut: FruitStore!

    override func setUpWithError() throws {
        sut = FruitStore(defaultStock: 10)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFruitStore_더하기() {
//        sut.add(item: .mango, 개수: 8)
        XCTAssertEqual(sut.items[.mango]!, 18)
    }
    
    func testFruitStore_빼기() {
//        try? sut.subtract(item: .strawberry, 개수: 3)
        XCTAssertEqual(sut.items[.strawberry]!, 7)
    }
    
    func testFruitStore_충분() {
        let itemz = [Fruit.banana: 3, Fruit.strawberry: 3]
        let result = sut.hasEnough(pairOfItems: itemz)
        XCTAssertTrue(result)
    }
    
    func testFruitStore_충분하지_않은_경우() {
        let itemz = [Fruit.banana: 3, Fruit.kiwi: 20]
        let result = sut.hasEnough(pairOfItems: itemz)
        XCTAssertFalse(result)
    }
    
    
    
    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
