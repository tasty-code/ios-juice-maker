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
            fruitJuiceNumber = fruitStore.banana - 2
            print(fruitJuiceNumber)
        default:
            print("잘못")
        }
    }
}



