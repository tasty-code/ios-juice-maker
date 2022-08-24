//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let Fruit = FruitStore()

// 쥬스 메이커 타입
struct JuiceMaker {
    func selectJuice(fruit: String) {
        switch fruit{
        case "strawberry":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "banana":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "pineapple":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "kiwi":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "mango":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "strawberryBanana":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        case "mangoKiwi":
            if checkStock(fruit: fruit) == true {
                printFruitJuice(fruit: fruit)
            }
        default:
            print("이상한 값 등장!")
        }
    }
}
