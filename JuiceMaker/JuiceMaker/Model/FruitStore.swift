//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    //!!! pr 전 주석은 전부 지워주세요 FruitStore와 JuiceMaker 둘 다요 !!!
    //
    //미완성 : 매개변수 name으로 받아온 항목을 fruits 딕셔너리에서 찾아 value를 반환하는 함수
    func getAmount(of name: Fruit) -> Int {
        //임시로 0을 반환하도록 했습니다. 함수 완성 후 결과값을 반환하도록 수정해주세요.
        return 0
    }
    //미완성 : 매개변수 name으로 받아온 항목을 fruits 딕셔너리에서 찾은 후 해당 과일의 갯수를 amount 만큼 증가시키는 함수
    func increase(of name: Fruit, to amount: Int) {
        
    }
    //미완성 : 매개변수 name으로 받아온 항목을 fruits 딕셔너리에서 찾은 후 해당 과일의 갯수를 amount 만큼 감소시키는 함수
    func decrease(of name: Fruit, to amount: Int) {
        
    }
}
