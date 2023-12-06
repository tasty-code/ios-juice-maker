//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 강창현 on 12/5/23.
//

import XCTest
@testable import JuiceMaker
final class JuiceMakerTests: XCTestCase {
    private var sut: JuiceMaker!
    override func setUpWithError() throws {
        sut = JuiceMaker()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_딸기재고의_초기값이_10개라_딸기쥬스를_만들수_있는_재고가_없다() {
        XCTAssertThrowsError(try sut.checkUnderstockedFruits(juice: .strawberryJuice), "딸기 재고 있음! 테스트 실패")
    }
    
    func test_망고키위쥬스를_만드는데_망고_키위_둘다_재고가_없다() {
        sut.fruitStore.mangoStock = 0
        sut.fruitStore.kiwiStock = 0
        
        sut.makeJuice(juice: .mangoKiwiJuice)
        print(sut.fruitStore.kiwiStock)
    }
    
    func test_망고키위쥬스를_만드는데_망고만_재고가_없다() {
        sut.fruitStore.mangoStock = 0
        sut.makeJuice(juice: .mangoKiwiJuice)
    }
    
    func test_망고쥬스를_만들고_남은_망고는_7개다() {
        sut.makeJuice(juice: .mangoJuice)
        let result: Int = 7
        let remainMango: Int = sut.fruitStore.mangoStock
        
        XCTAssertEqual(result, remainMango, "망고쥬스를 만들고 남은 망고는 7개 아닙니다! 테스트 실패")
    }
    
    func test_파인애플의_재고를_3개로_바꾼다() {
        sut.fruitStore.manageFruitsStocks(.pineapple, count: 3)
        let result: Int = 3
        let remainPineapple: Int  = sut.fruitStore.pineappleStock
        
        XCTAssertEqual(result, remainPineapple, "파인애플의 재고는 3개가 아닙니다! 테스트 실패")
    }
}
