//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
  let store = FruitStore.shared
  
  enum Juice: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
  }
  
  func makeJuice(type: Juice) {
    do {
      switch type {
      case .strawberry:
        if try store.checkInventory(fruitName: .strawberry, num: 16) {
          store.subtract(fruitName: .strawberry, num: 16)
        }
      case .banana:
        if try store.checkInventory(fruitName: .banana, num: 2) {
          store.subtract(fruitName: .banana, num: 2)
        }
      case .kiwi:
        if try store.checkInventory(fruitName: .kiwi, num: 3) {
          store.subtract(fruitName: .kiwi, num: 3)
        }
      case .pineapple:
        if try store.checkInventory(fruitName: .pineapple, num: 2) {
          store.subtract(fruitName: .pineapple, num: 2)
        }
      case .strawberryBanana:
        let checkOne = try store.checkInventory(fruitName: .strawberry, num: 10)
        let checkTwo = try store.checkInventory(fruitName: .banana, num: 1)
        if checkOne && checkTwo {
          store.subtract(fruitName: .strawberry, num: 10)
          store.subtract(fruitName: .banana, num: 1)
        }
      case .mango:
        if try store.checkInventory(fruitName: .mango, num: 3) {
          store.subtract(fruitName: .mango, num: 3)
        }
      case .mangoKiwi:
        let checkOne = try store.checkInventory(fruitName: .mango, num: 2)
        let checkTwo = try store.checkInventory(fruitName: .kiwi, num: 1)
        if checkOne && checkTwo {
          store.subtract(fruitName: .mango, num: 2)
          store.subtract(fruitName: .kiwi, num: 1)
        }
      }
    } catch FruitStoreError.outOfStock {
      print("재료가 없습니다.")
    } catch let error {
      print("또 다른 에러 발생 \(error)")
    }
  }
}
