//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        try fruitStore.consume(juice: juice)
    }
}
