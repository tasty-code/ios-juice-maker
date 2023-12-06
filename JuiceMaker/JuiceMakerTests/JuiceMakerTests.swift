//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by nayeon  on 2023/12/06.
//

import XCTest

final class JuiceMakerTests: XCTestCase {
    
    func test_makeJuice() {
        var juiceMaker = JuiceMaker()
        juiceMaker.makeJuice(juice: .strawberry)
        juiceMaker.makeJuice(juice: .mango)
        juiceMaker.makeJuice(juice: .kiwi)
        juiceMaker.makeJuice(juice: .strawberryBanana)
    }

}
