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
    
    static let dictionary: [String: JuiceName] = [
        딸기쥬스.rawValue: 딸기쥬스,
        바나나쥬스.rawValue: 바나나쥬스,
        키위쥬스.rawValue: 키위쥬스,
        파인애플_쥬스.rawValue: 파인애플_쥬스,
        딸바쥬스.rawValue: 딸바쥬스,
        망고_쥬스.rawValue: 망고_쥬스,
        망고키위_쥬스.rawValue: 망고키위_쥬스,
    ]
}

struct JuiceMaker {
    let needFruitQuantity: [JuiceName: [FruitName: Int]] = [
        .딸기쥬스: [
            .strawberry: 16
        ],
        .바나나쥬스: [
            .banana: 2
        ],
        .키위쥬스: [
            .kiwi: 3
        ],
        .파인애플_쥬스: [
            .pineapple: 2
        ],
        .딸바쥬스: [
            .strawberry: 10,
            .banana: 1
        ],
        .망고_쥬스: [
            .mango: 3
        ],
        .망고키위_쥬스: [
            .mango: 2,
            .kiwi: 1
        ],
    ]
    var fruitStore = FruitStore()

    init () {}
}
