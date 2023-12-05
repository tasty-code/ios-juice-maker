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
    
    func test_딸기쥬스를_만들수_있는_재고가_없다() {
        let result = sut.hasEnoughStock(juice: .strawberryJuice)
        
        XCTAssertEqual(result, false, "딸기 재고 없음! 테스트 성공")
    }
    
    func test_바나나쥬스를_만들수_있는_재고가_있다() {
        let result = sut.hasEnoughStock(juice: .bananaJuice)
        
        XCTAssertEqual(result, true, "바나나 재고 있음! 테스트 성공")
    }
    
    func test_딸기_기본재고_10개로_쥬스를_만들수_없다() {
        sut.makeJuice(juice: .strawberryJuice)
    }
    
    func test_망고키위쥬스를_만드는데_망고_키위_둘다_재고가_없다() {
        sut.fruitStore.mangoStock = 0
        sut.fruitStore.kiwiStock = 0
        
        sut.makeJuice(juice: .mangoKiwiJuice)
    }
    
    func test_망고쥬스를_만들고_남은_망고는_7개다() {
        sut.makeJuice(juice: .mangoJuice)
        let result: Int = 7
        let remainMango: Int = sut.fruitStore.mangoStock
        
        XCTAssertEqual(result, remainMango, "망고쥬스를 만들고 남은 망고는 7개 입니다! 테스트 성공")
    }
}
