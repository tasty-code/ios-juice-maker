//
//  Error.swift
//  JuiceMaker
//
//  Created by 김동준 on 12/8/23.
//

enum InventoryError: Error {
    static let outOfStockMessage = "재료 없음. 재고를 수정할까요?"
    static let fruitThatDoesNotExistMessage  = "그런 과일 없음"
    
    case inventoryError(description: String)
}
