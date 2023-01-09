//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 김용재 on 2023/01/08.
//

import XCTest
@testable import JuiceMaker


final class JuiceMakerTests: XCTestCase {
    
    var sut: FruitStore! // 1
    
    override func setUpWithError() throws {
        try super.setUpWithError()

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
