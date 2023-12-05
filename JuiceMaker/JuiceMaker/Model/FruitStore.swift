//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
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
    
    
    
    
}
