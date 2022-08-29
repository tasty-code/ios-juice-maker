//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitName: String {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    var fruits: [FruitName: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
    init() {}
}
