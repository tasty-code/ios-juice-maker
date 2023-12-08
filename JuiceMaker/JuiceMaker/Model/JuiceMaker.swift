//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()

    func makeJuice(juiceName: JuiceName) {
        for (fruitName, fruitQuantity) in juiceName.recipe {
            consumeFruit(fruitName: fruitName, fruitQuantity: fruitQuantity)
        }
    }
    
    private func consumeFruit(fruitName: FruitName, fruitQuantity: Int) {
        do {
            try fruitStore.consumeFruit(fruitName: fruitName, fruitQuantity: fruitQuantity)
        } catch JuiceError.outOfStock {
            print(JuiceError.outOfStock.localizedDescription)
        } catch {
            print(JuiceError.unknown.localizedDescription)
        }
    }
}
