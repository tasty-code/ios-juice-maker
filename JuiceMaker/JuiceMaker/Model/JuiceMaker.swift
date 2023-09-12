//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var orderList = [Menu]()
    let myFruitStore: FruitStore = FruitStore()
    
    func getRecipe(_ menu: Menu) -> [Fruit: Int] {
        return menu.recipe
    }
    func order(_ userInput: Menu) {
        do {
            let checkedMenu = try checkAvailable(userInput)
            makeJuice(checkedMenu)
        } catch {
            print("솔드아웃입니다")
        }
    }
    func checkAvailable(_ userInput: Menu) throws -> Menu {
        let recipe = getRecipe(userInput)
        // type casting
        var keys = Array(recipe.keys) as [Fruit]
        let remains = myFruitStore.getRemains(keys)
        
        for (fruit, number) in recipe {
            guard let fruitStock = remains[fruit], fruitStock >= number else {
                throw OrderError.soldOut
            }
            continue
        }
        return userInput
    }
    func makeJuice(_ menu: Menu) {
        myFruitStore.deduct(menu.recipe)
        print("주문하신 \(menu.rawValue)")
    }
}

/**
 재료가 정해졌다. - 레시피
 getRemain에 접근해서 remains를 받는다
 레시피에서 필요한 양과 remains에서 가지고 있는 양을 서로 비교한다
 남아있다면 makeJuice
없다면 soldOutError를 띄운다

 * 이슈
 현재는 레시피를 string으로 받아왔는데, getRemain에서는 Enum을 사용하고 있다.
    -> 1) string -> Enum => pros and cons 한번 더 변환할 필요가 없다
        2) string -> string => pros and cons
        3) 새로운 타입으로 맞춰준다 => pros and cons
 */
