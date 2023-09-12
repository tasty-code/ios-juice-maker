//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
  //  enum
  
  func order() {
    print("주문해주세요.")
    guard let fruitOrder = readLine() else { }
  }
}
