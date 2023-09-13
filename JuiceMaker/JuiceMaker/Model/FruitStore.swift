//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
  static let shared = FruitStore()
  
  enum Fruit: String {
    case strawberry
    case pineapple
    case banana
    case kiwi
    case mango
  }
  
  private let initValue = 10
  private var inventory = [Fruit.strawberry: 0, Fruit.pineapple: 0, Fruit.banana: 0, Fruit.kiwi: 0, Fruit.mango: 0]
  
  init() {
    for fruitList in inventory {
      inventory.updateValue(initValue, forKey: fruitList.key)
    }
  }
  
  func add(fruitName: Fruit, num: Int) {
    let currentNum = getNum(fruitName: fruitName)
    let result = currentNum + num
    inventory.updateValue(result, forKey: fruitName)
  }
  
  func subtract(fruitName: Fruit, num: Int) {
    let currentNum = getNum(fruitName: fruitName)
    let result = currentNum - num
    inventory.updateValue(result, forKey: fruitName)
  }
  
  func getNum(fruitName: Fruit) -> Int {
    let currentNum = inventory[fruitName] ?? 0
    print(currentNum)
    return currentNum
  }
  
  func checkInventory(fruitName: Fruit, num: Int) throws -> Bool {
    let currentNum = getNum(fruitName: fruitName)
    if currentNum < num {
      throw FruitStoreError.outOfStock
    }
    return true
  }
}
