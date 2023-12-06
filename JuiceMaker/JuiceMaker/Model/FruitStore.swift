//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum InventoryError : Error {
            static let outOfStockMessage = "재료 없음. 재고를 수정할까요?"

            case inventoryError(description: String)
        }
    
    var inventory: [Fruit:Int] = [:]

      init() {
          for fruit in Fruit.allCases {
              let firstAmount = 10
              inventory[fruit] = firstAmount
          }
      }

      func increaseStock(fruit: Fruit, num: Int) {
          let result = inventory[fruit]! + num
          inventory[fruit] = result
      }

      func decreaseStock(fruit: Fruit, num: Int) {
          let result = inventory[fruit]! - num
          inventory[fruit] = result
      }

      func updateStock(fruit: Fruit, num: Int) {
          inventory.updateValue(num, forKey: fruit)
      }
    
    // 재고 체킹 함수 checkStock
    // amountOfFruitNow: 현재 과일의 수   amountRequired: 필요한 과일의 수
    func checkStock(amountOfFruitNow: Int, amountRequired: Int) throws {
        guard amountOfFruitNow > amountRequired else {
            throw InventoryError.inventoryError(description: InventoryError.outOfStockMessage)
        }
    }
    
    // 재료 체킹 함수 checkIngredients
    func checkIngredients() {
        
    }
    
    // 재료 사용 함수 useIngredients
    func useIngredients() {
        
    }
    
    // 주스 produce 성공시 재고 소비, 에러뜨면 catch문으로
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        // 필요한 재료의 수량 체크해서 과일 몇개인지
        let amountOfFruit = try checkIngredients()
    
        useIngredients()
    }
}

// 만들기    -> / 재고 소비       ->      재료 체크     (재고 체크)     -> 재료 사용        -> 재고 감소
// JuiceMaker /    FruitStore
// produce -> / consumeStocks -> checkIngredients (checkStock) -> useIngredients -> decreaseStock
