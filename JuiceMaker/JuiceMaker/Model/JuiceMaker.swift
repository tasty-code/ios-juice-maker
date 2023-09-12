//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
  let store = FruitStore.shared
  
  enum JuiceType: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
  }
  
  func makeJuice(type: JuiceType) {
    switch type {
    case .strawberry:
      store.subtract(fruitName: .strawberry, num: 16)
    case .banana:
      store.subtract(fruitName: .banana, num: 2)
    case .kiwi:
      store.subtract(fruitName: .kiwi, num: 3)
    case .pineapple:
      store.subtract(fruitName: .pineapple, num: 2)
    case .strawberryBanana:
      store.subtract(fruitName: .strawberry, num: 10)
      store.subtract(fruitName: .banana, num: 1)
    case .mango:
      store.subtract(fruitName: .mango, num: 3)
    case .mangoKiwi:
      store.subtract(fruitName: .mango, num: 2)
      store.subtract(fruitName: .kiwi, num: 1)
    }
  }
}
