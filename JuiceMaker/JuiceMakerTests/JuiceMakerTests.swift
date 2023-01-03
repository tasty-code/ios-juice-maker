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
        sut = FruitStore(개수: 10)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFruitStore_더하기() {
        sut.add(item: .망고, 개수: 8)
        XCTAssertEqual(sut.items[.망고]!, 18)
    }
    
    func testFruitStore_빼기() {
        try? sut.subtract(item: .딸기, 개수: 3)
        XCTAssertEqual(sut.items[.딸기]!, 7)
    }
    
    func testFruitStore_충분() {
        let itemz = [(Fruit.바나나, 3), (Fruit.딸기, 3)]
        let result = sut.isEnough(itemz: itemz)
        XCTAssertTrue(result)
    }
    
    func testFruitStore_충분하지_않은_경우() {
        let itemz = [(Fruit.바나나, 3), (Fruit.키위, 20)]
        let result = sut.isEnough(itemz: itemz)
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
