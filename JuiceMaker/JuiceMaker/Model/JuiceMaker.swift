//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var store: FruitStore
    
    init(store: FruitStore) {
        self.store = store
        self.store.initFruits()
    }
    
    func order(_ recipe: Recipe) {
        do {
            try takeOrder(recipe)
        } catch Errors.orderStrawberry {
            print("FruitStore에 과일이 부족합니다!!!")
        }
        catch {
            print("FruitStore에 과일이 부족합니다!!!")
        }
    }
    
    func takeOrder(_ kind: Recipe) throws {
        print("주문하신 쥬스는 \(kind.rawValue) 입니다" )
        let arr = kind.rawValue.split(separator: ",")
        if arr.count == 1 {
            guard let fruitsStock = store.fruits[String(arr[0])],
                  let recipe = store.recipes[String(arr[0])],
                    fruitsStock >= recipe[0]
            else {
                throw caseError(kind)
            }
            store.fruits[String(arr[0])] = fruitsStock - recipe[0]
        } else {
            try arr.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      let recipe = store.recipes[kind.rawValue],
                      fruitsStock >= recipe[index] else {
                    throw caseError(kind)
                }
                store.fruits[String(fruit)] = fruitsStock - recipe[index]
            }
        }
    }

    func makeSingleIngredientJuice() {
        
    }
    
    func makeMultiIngredientJuice() {
        
    }
    
    func caseError(_ kind: Recipe) -> Errors {
        switch kind {
        case Recipe.strawberry:
            print("Errors.orderStrawberry")
            return Errors.orderStrawberry
        case Recipe.banana:
            return Errors.orderBanana
        case Recipe.kiwi:
            return Errors.orderKiwi
        case Recipe.pineapple:
            return Errors.orderPineapple
        case Recipe.strawberryBanana:
            return Errors.orderStrawberryBanana
        case Recipe.mango:
            return Errors.orderMango
        case Recipe.mangoKiwi:
            return Errors.orderMangoKiwi
        }
    }
}
