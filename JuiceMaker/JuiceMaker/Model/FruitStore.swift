//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
  enum Fruit: String {
    case strawberry
    case pineapple
    case banana
    case kiwi
    case mango
  }
  
  var strawberryInventory = 10
  var pineappleInventory = 10
  var bananaInventory = 10
  var kiwiInventory = 10
  var mangoInventory = 10
  
  func add(fruitName: String, num: Int) {
    switch fruitName {
    case Fruit.strawberry.rawValue:
      strawberryInventory += num
    case Fruit.pineapple.rawValue:
      pineappleInventory += num
    case Fruit.banana.rawValue:
      bananaInventory += num
    case Fruit.kiwi.rawValue:
      kiwiInventory += num
    case Fruit.mango.rawValue:
      mangoInventory += num
    default:
      break
    }
  }
  
  func minus(fruitName: String, num: Int) {
    switch fruitName {
    case Fruit.strawberry.rawValue:
      strawberryInventory -= num
    case Fruit.pineapple.rawValue:
      pineappleInventory -= num
    case Fruit.banana.rawValue:
      bananaInventory -= num
    case Fruit.kiwi.rawValue:
      kiwiInventory -= num
    case Fruit.mango.rawValue:
      mangoInventory -= num
    default:
      break
    }
  }
}
