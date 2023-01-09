//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 김용재 on 2023/01/08.
//

import XCTest
@testable import JuiceMaker


final class JuiceMakerTests: XCTestCase {
    
    var sut: JuiceMaker!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JuiceMaker()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_기본재고시_딸기쥬스_제조에_실패한다() {
        XCTAssertThrowsError(try sut.makeJuice(of: .strawberry))
    }
    
    func test_망고쥬스_제조후에_재고가_3만큼_줄어든다() throws {
        let initialStock = FruitStore.shared.stock[.mango]!
        try sut.makeJuice(of: .mango)
        let changedStock = FruitStore.shared.stock[.mango]!
        let expectation = 3
        
        XCTAssertEqual(initialStock - changedStock, expectation)
    }
}
