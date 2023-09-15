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
  
  private let initialValue = 10
  private var inventory = [Fruit.strawberry: 0, Fruit.pineapple: 0, Fruit.banana: 0, Fruit.kiwi: 0, Fruit.mango: 0]
  
  init() {
    for fruitList in inventory {
      inventory.updateValue(initialValue, forKey: fruitList.key)
    }
  }
  
  func add(fruitName: Fruit, number: Int) {
    let currentNumber = getNum(fruitName: fruitName)
    let result = currentNumber + number
    inventory.updateValue(result, forKey: fruitName)
  }
  
  func subtract(fruitName: String, number: Int) {
    guard let fruit = Fruit(rawValue: fruitName) else { return }
    let currentNumber = getNum(fruitName: fruit)
    let result = currentNumber - number
    inventory.updateValue(result, forKey: fruit)
  }
  
  func getNum(fruitName: Fruit) -> Int {
    let currentNumber = inventory[fruitName] ?? 0
    print(currentNumber)
    return currentNumber
  }
  
  func checkInventory(fruitName: String, number: Int) throws {
    guard let fruit = Fruit(rawValue: fruitName) else { return }
    let currentNumber = getNum(fruitName: fruit)
    if currentNumber < number {
      throw FruitStoreError.outOfStock
    }
  }
}
