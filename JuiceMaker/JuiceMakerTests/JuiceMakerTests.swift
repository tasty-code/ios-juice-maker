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
    
    func test_기본재고시_딸기쥬스_제조에_실패한다() {
        XCTAssertThrowsError(try sut.makeJuice(of: .strawberry))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
