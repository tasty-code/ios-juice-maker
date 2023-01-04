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
        FSsut = FruitStore(defaultStock: 10)
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
        FSsut.subtract(pairOfItems: [.mango: 3])
        XCTAssertEqual(FSsut.items[.mango]!, 7)
    }
    
    func testFruitStore_충분() {
        let itemz = [Fruit.banana: 3, Fruit.strawberry: 3]
        let result = FSsut.hasEnough(pairOfItems: itemz)
        XCTAssertTrue(result)
    }
    
    func testFruitStore_충분하지_않은_경우() {
        print()
        print(#function)
        print()
//        FSsut.setAllStocks(to: 10)
        let result = FSsut.hasEnough(pairOfItems: [.banana: 3, .kiwi: 20])
        XCTAssertFalse(result)
    }
    
    func test_제조불가_JuiceMaker() {
        print()
        print(#function)
        print()
//        FSsut.setAllStocks(to: 10)
        XCTAssertThrowsError(try JMsut.make(juice: .strawberryJuice))
    }

    func test_제조가능_JuiceMaker() {
        print()
        print(#function)
        print()
//        FSsut.setAllStocks(to: 10)
        let juice: Juice!
        juice = try? JMsut.make(juice: .bananaJuice)
        XCTAssertEqual(juice, Juice.bananaJuice)
    }
    
    func testPerformanceExample() throws {
        print()
        print(#function)
        print()
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
