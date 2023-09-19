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
    
    var recipe: Dictionary<Fruit, Int> {
      switch self {
      case .strawberry: return [.strawberry: 16]
      case .banana: return [.banana: 2]
      case .kiwi: return [.kiwi: 3]
      case .pineapple: return [.pineapple: 2]
      case .strawberryBanana: return [.strawberry: 10, .banana: 1]
      case .mango: return [.mango: 3]
      case .mangoKiwi: return [.mango: 2, .kiwi: 1]
      }
    }
  }
  
  func createJuice(type: Int) {
    if checkAvailableJuice(type: type) {
      makeJuice(type: type)
    }
  }
  
  private func checkAvailableJuice(type: Int) -> Bool {
    do {
      guard let juiceType = Juice(rawValue: type) else { return false }
      let recipe = juiceType.recipe
      for (fruit, number) in recipe {
        try store.checkInventory(fruitName: fruit, number: number)
      }
    } catch let error {
      if error as! FruitStoreError == FruitStoreError.outOfStock {
        print("재고가 없습니다.")
        return false
      }
    }
    return true
  }
  
  private func makeJuice(type: Int) {
    guard let juiceType = Juice(rawValue: type) else { return }
    let recipe = juiceType.recipe
    for (fruit, number) in recipe {
      store.subtract(fruitName: fruit, number: number)
    }
  }
}
