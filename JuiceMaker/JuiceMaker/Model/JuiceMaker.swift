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
      store.minus(fruitName: .strawberry, num: 16)
    case .banana:
      store.minus(fruitName: .banana, num: 2)
    case .kiwi:
      store.minus(fruitName: .kiwi, num: 3)
    case .pineapple:
      store.minus(fruitName: .pineapple, num: 2)
    case .strawberryBanana:
      store.minus(fruitName: .strawberry, num: 10)
      store.minus(fruitName: .banana, num: 1)
    case .mango:
      store.minus(fruitName: .mango, num: 3)
    case .mangoKiwi:
      store.minus(fruitName: .mango, num: 2)
      store.minus(fruitName: .kiwi, num: 1)
    }
  }
}
