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
  
  let initValue = 10
  var inventory = ["strawberry": 0, "pineapple": 0, "banana": 0, "kiwi": 0, "mango": 0]
  
  init() {
    for fruitList in inventory {
      inventory.updateValue(initValue, forKey: fruitList.key)
    }
  }
  
  func add(fruitName: Fruit, num: Int) {
    guard let currentNum = getNum(fruitName: fruitName) else { return }
    let result = currentNum + num
    inventory.updateValue(result, forKey: fruitName.rawValue)
  }
  
  func subtract(fruitName: Fruit, num: Int) {
    guard let currentNum = getNum(fruitName: fruitName) else { return }
    let result = currentNum - num
    inventory.updateValue(result, forKey: fruitName.rawValue)
  }
  
  func getNum(fruitName: Fruit) -> Int? {
    guard let currentNum = inventory[fruitName.rawValue] else { return nil }
    print(currentNum)
    return currentNum
  }
  
  func checkInventory(fruitName: Fruit, num: Int) -> Bool {
    guard let currentNum = getNum(fruitName: fruitName) else { return false }
    return currentNum >= num
  }
}
