//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juiceMenu: JuiceMenu) -> Result<Void, JuiceError> {
        do {
            for (fruitName, fruitQuantity) in juiceMenu.recipe {
                try fruitStore.consumeFruit(fruitName: fruitName, fruitQuantity: fruitQuantity)
            }
        } catch JuiceError.outOfStock {
            return .failure(JuiceError.outOfStock)
        } catch {
            return .failure(JuiceError.unknown)
        }
        return .success(())
    }
}
