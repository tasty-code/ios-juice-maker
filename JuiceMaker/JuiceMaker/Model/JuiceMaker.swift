//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let Fruit = FruitStore()

func checkStock(fruit: String) -> Bool {
    switch fruit{
    case "strawberry":
        if (Fruit.strawberry - 16) >= 0 {
            Fruit.changeStock(strawberry: -16)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "banana":
        if (Fruit.banana - 2) >= 0 {
            Fruit.changeStock(banana: -2)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "pineapple":
        if (Fruit.pineapple - 2) >= 0 {
            Fruit.changeStock(pineapple: -2)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "kiwi":
        if (Fruit.kiwi - 3) >= 0 {
            Fruit.changeStock(kiwi: -3)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "mango":
        if (Fruit.mango - 3) >= 0 {
            Fruit.changeStock(mango: -3)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "strawberryBanana":
        if (Fruit.strawberry - 10) >= 0 && (Fruit.banana - 1) >= 0 {
            Fruit.changeStock(strawberry: -10, banana: -1)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }
    case "mangoKiwi":
        if (Fruit.mango - 2) >= 0 && (Fruit.kiwi - 1) >= 0 {
            Fruit.changeStock(kiwi: -1, mango: -2)
            return true
        } else {
            print("재고가 없어요 ㅜ")
        }

    default:
        print("이상한 값 등장!")
    }
    
    return false
}

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
