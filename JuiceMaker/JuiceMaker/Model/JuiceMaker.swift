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
        guard let fruitName = juiceName.recipe.keys.first, let fruitQuantity = juiceName.recipe.values.first else { return }
        do {
            try fruitStore.consumeFruit(fruitName: fruitName, fruitQuantity: fruitQuantity)
        } catch JuiceError.outOfStock {
            print(JuiceError.outOfStock.localizedDescription)
        } catch {
            print("알 수 없는 에러")
        }
    }
}
