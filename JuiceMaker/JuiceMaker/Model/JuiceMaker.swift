//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

struct JuiceMaker {
    
    func make(juice: Juice) throws {
        do {
            for (fruit, quantity) in juice.recipe {
                try FruitStore.shared.consume(fruit: fruit, amount: quantity)
            }
            print("\(juice.name) 나왔습니다.")
        } catch JuceMakerError.negativeAmount {
            print("음수입니다.")
        } catch JuceMakerError.outOfStock {
            print("재고부족")
        }
    }
}
