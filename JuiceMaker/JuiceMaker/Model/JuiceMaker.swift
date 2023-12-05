//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func isEnouph(juiceMenu: JuiceMenu) -> Bool {
        var stockCheck: Bool = true
        for (fruit, number) in juiceMenu.recipe {
            guard fruitStore.checkStock(fruit: fruit, stock: number) else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
    func makeJuice(juiceMenu: JuiceMenu) -> Juice? {
        guard isEnouph(juiceMenu: juiceMenu) else {
            print("재고 없어용ㅠㅠ")
            return nil
        }
        
        juiceMenu.recipe.forEach { (fruit: Fruit, number: Int) in
            fruitStore.release(fruit: fruit, stock: number)
        }
        
        print("\(juiceMenu.name) 나왔습니다.")
        return Juice(juiceMenu: juiceMenu)
    }
    
}
