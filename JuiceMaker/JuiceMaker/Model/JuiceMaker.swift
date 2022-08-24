//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    
    
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
            print(strawberrys)
            if strawberrys < 16 {
                print("과일을 제조할 수 없습니다.")
            }
        case "banana":
            bananas = bananas - 2
            print(bananas)
            if bananas < 2 {
                print("과일을 제조할 수 없습니다.")
            }
        case "kiwi":
            kiwis = kiwis - 3
            print(kiwis)
            if kiwis < 3 {
                print("과일을 제조할 수 없습니다.")
            }
        case "strawbanana":
            strawberrys = strawberrys - 10
            print(strawberrys)
            bananas = bananas - 1
            print(bananas)
            if strawberrys < 10 && bananas < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        case "pineapple":
            pineapples = pineapples - 2
            print(pineapples)
            if pineapples < 2 {
                print("과일을 제조할 수 없습니다.")
            }
        case "mango":
            mangos = mangos - 3
            print(mangos)
            if mangos < 3 {
                print("과일을 제조할 수 없습니다.")
            }
        case "mangokiwi":
            mangos = mangos - 3
            print(mangos)
            kiwis = kiwis - 3
            print(kiwis)
            if mangos < 2 && kiwis < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        default:
            print("잘못")
        }
    }
}



