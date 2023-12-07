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
        self.store.initializeFruit()
    }
    
    func showMenu() {
        print("어서오세요 아래 매뉴중 하나를 선택해주세요!\n딸바쥬스, 망키쥬스, 딸기쥬스, 바나나쥬스, 파인애플쥬스, 키위쥬스, 망고쥬스")
    }
    
    func order(_ recipe: Recipe) {
        print("주문하신 쥬스는 \(recipe) 입니다" )
        do {
            try takeOrder(recipe)
        } catch Errors.orderFail(let recipe) {
            print("\(recipe) 주문에 실패 했습니다...")
            print("\(self.store.fruits)")
        }
        catch {
            print("unknown error")
        }
    }
    
    func takeOrder(_ kind: Recipe) throws {
        let arr = kind.rawValue.split(separator: ",")
        if arr.count == 1 {
            guard let fruitsStock = store.fruits[String(arr[0])],
                  let recipe = store.recipes[String(arr[0])],
                    fruitsStock >= recipe[0]
            else {
                throw Errors.orderFail(kind)
            }
            store.fruits[String(arr[0])] = fruitsStock - recipe[0]
        } else {
            try arr.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      let recipe = store.recipes[kind.rawValue],
                      fruitsStock >= recipe[index] else {
                    throw Errors.orderFail(kind)
                }
                store.fruits[String(fruit)] = fruitsStock - recipe[index]
            }
        }
    }
}
