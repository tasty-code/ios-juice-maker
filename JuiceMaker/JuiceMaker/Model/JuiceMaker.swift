//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceName: String {
    case 딸기쥬스
    case 바나나쥬스
    case 키위쥬스
    case 파인애플_쥬스 = "파인애플 쥬스"
    case 딸바쥬스
    case 망고_쥬스 = "망고 쥬스"
    case 망고키위_쥬스 = "망고키위 쥬스"
}

struct JuiceMaker {
    var fruitStore = FruitStore()

    init () {}
}
