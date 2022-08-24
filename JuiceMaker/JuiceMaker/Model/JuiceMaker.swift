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
        
        var fruitJuiceNumber: Int = 0
        
        switch choiceJuice {
        case "strawberry":
            fruitJuiceNumber = fruitStore.strawberry + fruitStore.change - 16
            print(fruitJuiceNumber)
            
            if fruitJuiceNumber < 16 {
                print("과일을 제조할 수 없습니다.")
            }
        case "banana":
            fruitJuiceNumber = fruitStore.banana + fruitStore.change - 2
            print(fruitJuiceNumber)
            if fruitJuiceNumber < 2 {
                print("과일을 제조할 수 없습니다.")
            }
        case "kiwi":
            fruitJuiceNumber = fruitStore.kiwi + fruitStore.change - 3
            print(fruitJuiceNumber)
            if fruitJuiceNumber < 3 {
                print("과일을 제조할 수 없습니다.")
            }
        case "딸바주스":
            fruitJuiceNumber = (fruitStore.strawberry + fruitStore.change - 10) + (fruitStore.banana + fruitStore.change - 1)
            print(fruitJuiceNumber)
            if  fruitStore.strawberry < 10 && fruitStore.banana < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        case "pineapple":
            fruitJuiceNumber = fruitStore.pineapple + fruitStore.change - 2
            print(fruitJuiceNumber)
            if fruitJuiceNumber < 2 {
                print("과일을 제조할 수 없습니다.")
            }
        case "mango":
            fruitJuiceNumber = fruitStore.mango + fruitStore.change - 3
            print(fruitJuiceNumber)
            if fruitJuiceNumber < 3 {
                print("과일을 제조할 수 없습니다.")
            }
        case "망고키위":
            fruitJuiceNumber = (fruitStore.mango + fruitStore.change - 2) + (fruitStore.kiwi + fruitStore.change - 1)
            print(fruitJuiceNumber)
            if fruitStore.mango < 2 && fruitStore.kiwi < 1 {
                print("과일을 제조할 수 없습니다.")
            }
        default:
            print("잘못")
        }
    }
}



