//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func exceedNumberOfFruits(fruit: Int, num: Int) -> Void {
        if fruit < num {
            print("과일을 제조할 수 없습니다.")
        }
    }
    
    func makeJuice() {
        guard let choiceJuice: String = readLine() else{
            return
        }
        
        var strawberrys = fruitStore.strawberry + fruitStore.change
        var bananas = fruitStore.banana + fruitStore.change
        var pineapples = fruitStore.pineapple + fruitStore.change
        var kiwis = fruitStore.kiwi + fruitStore.change
        var mangos = fruitStore.mango + fruitStore.change

        switch choiceJuice {
        case "strawberry":
            strawberrys = strawberrys - 16
            exceedNumberOfFruits(fruit: strawberrys, num: 16)
        case "banana":
            bananas = bananas - 2
            exceedNumberOfFruits(fruit: bananas, num: 2)
        case "kiwi":
            kiwis = kiwis - 3
            exceedNumberOfFruits(fruit: kiwis, num: 3)
        case "strawbanana":
            strawberrys = strawberrys - 10
            bananas = bananas - 1
            if strawberrys < 10 && bananas < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        case "pineapple":
            pineapples = pineapples - 2
            exceedNumberOfFruits(fruit: pineapples, num: 2)
        case "mango":
            mangos = mangos - 3
            exceedNumberOfFruits(fruit: kiwis, num: 3)
        case "mangokiwi":
            mangos = mangos - 3
            kiwis = kiwis - 3
            if mangos < 2 && kiwis < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        default: break
        }
    }
}
