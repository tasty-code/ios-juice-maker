//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입

/// singleton 적용하기

class FruitStore {
    static var shared = FruitStore(defaultStock: 10)
    
    // TODO:- 열거형들 재고 딕셔너리 만들기 [key: value] = [fruit: Int]
    enum Fruits: CaseIterable {
        case strawberries
        case bananas
        case kiwis
        case pineapples
        case mangos
    }
    
    var overallStock = [Fruits: Int]()
    
    // 재고 확인용
    func checkStock(of fruit: Fruits) -> Int {
        guard let stock = overallStock[fruit] else { return 0 }
        return stock
    }
    
    // 과일 재고 n개 감소
    func decrease(of fruit: Fruits, amount: Int) {
        guard let stock = overallStock[fruit] else { return }
        overallStock.updateValue(stock - amount, forKey: fruit)
    }
    
    // TODO:- init에 기본값 넣기, 10개씩 초기화
    private init(defaultStock: Int) {
        Fruits.allCases.forEach { overallStock[$0] = defaultStock }
    }
}
