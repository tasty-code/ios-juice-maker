//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    
    enum JuiceMakingResult {
        case success(message: String)
        case failure(description: String)
    }
    
    let fruitStore: FruitStore
    
    func produce(_ menuName: JuiceMenu) -> JuiceMakingResult {
        let recipes = menuName.receiveRecipes()
        var outcomeCreated: JuiceMakingResult 
        
        do {
            try fruitStore.consumeStocks(recipes)
            
            let completeOrderMessage = "주문한 메뉴 나옴"
            outcomeCreated = .success(message: "\(menuName) \(completeOrderMessage)")
        } catch InventoryError.outOfStock(description: let message) {
            outcomeCreated = .failure(description: message)
        } catch InventoryError.notExist(description: let message) {
            outcomeCreated = .failure(description: message)
        } catch {
            outcomeCreated = .failure(description: "Error")
        }
        return outcomeCreated
    }
    
}

