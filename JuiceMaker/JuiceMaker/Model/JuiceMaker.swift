//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juiceMenu: JuiceMenu) {
        for (fruitName, fruitQuantity) in juiceMenu.recipe {
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
    
//    do {
//        try fruitStore.consumeFruit(fruitName: fruitName, fruitQuantity: fruitQuantity)
//        // 쥬스 제조 성공
//        NotificationCenter.default.post(name: NSNotification.Name("JuiceMade"), object: nil)
//        print("Successfully made \(juiceMenu.recipe) juice")
//        return .success(())
//    } catch JuiceError.outOfStock {
//        return .failure(JuiceError.outOfStock)
//    } catch {
//        // 다른 예외적인 에러 처리
//        return .failure(JuiceError.unknown)
//    }
    
}
