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
    }
    
    
    
    func makeJuice(kind: Recipe) throws {
        let arr = kind.rawValue.split(separator: ",")
        if arr.count == 1 {
            guard let fruitsStock = store.fruits[String(arr[0])],
                  fruitsStock >= store.recipes[String(arr[0])]![0] else {
                throw JuiceMakerError.notEnoughKiwiStock
            }
            store.fruits[String(arr[0])] = fruitsStock - store.recipes[String(arr[0])]![0]
        } else {
            try arr.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      fruitsStock >= store.recipes[kind.rawValue]![index] else {
                    throw JuiceMakerError.notEnoughKiwiStock
                }
                store.fruits[String(fruit)] = fruitsStock - store.recipes[kind.rawValue]![index]
            }
        }
    }
    
    // 강제 언래핑 삭제 버전
    func makeJuice2(kind: String) throws {
        let arr = kind.split(separator: ",")
        if arr.count == 1 {
            guard let fruitsStock = store.fruits[String(arr[0])],
                  fruitsStock >= store.recipes[String(arr[0])]![0] else {
                throw JuiceMakerError.notEnoughKiwiStock
            }
            store.fruits[String(arr[0])] = fruitsStock - store.recipes[String(arr[0])]![0]
        } else {
            try arr.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      fruitsStock >= store.recipes[kind]![index] else {
                    throw JuiceMakerError.notEnoughKiwiStock
                }
                store.fruits[String(fruit)] = fruitsStock - store.recipes[kind]![index]
            }
        }
    }
    
    
    
    
    func makeStrawberryJuice() throws {
        guard let strawberryStock = store.fruits["strawberry"], strawberryStock >= 16 else {
            throw JuiceMakerError.notEnoughStrawberryStock
        }
        store.fruits["strawberry"] = strawberryStock - 16
    }
    
    func makeBananaJuice() throws {
        guard let bananaStock = store.fruits["banana"], bananaStock >= 2 else {
            throw JuiceMakerError.notEnoughBananaStock
        }
        store.fruits["banana"] = bananaStock - 2
    }
    
    func makeKiwiJuice() throws {
        guard let kiwiStock = store.fruits["kiwi"], kiwiStock >= 3 else {
            throw JuiceMakerError.notEnoughKiwiStock
        }
        store.fruits["kiwi"] = kiwiStock - 3
    }
    
    func makePineappleJuice() throws {
        guard let pineappleStock = store.fruits["pineapple"], pineappleStock >= 2 else {
            throw JuiceMakerError.notEnoughPineappleStock
        }
        store.fruits["pineapple"] = pineappleStock - 2
    }
    
    func makeStrawberryBananaJuice() throws {
        guard let strawberryStock = store.fruits["strawberry"], strawberryStock >= 10 else {
            throw JuiceMakerError.notEnoughStrawberryStock
        }
        guard let bananaStock = store.fruits["banana"], bananaStock >= 1 else {
            throw JuiceMakerError.notEnoughBananaStock
        }
        store.fruits["strawberry"] = strawberryStock - 10
        store.fruits["banana"] = bananaStock - 1
    }
    
    func makeMangoJuice() throws {
        guard let mangoStock = store.fruits["mango"], mangoStock >= 3 else {
            throw JuiceMakerError.notEnoughMangoStock
        }
        
        store.fruits["mango"] = mangoStock - 3
    }
    
    func makeMangoKiwiJuice() throws {
        guard let strawberryStock = store.fruits["mango"], strawberryStock >= 2 else {
            throw JuiceMakerError.notEnoughStrawberryStock
        }
        guard let bananaStock = store.fruits["kiwi"], bananaStock >= 1 else {
            throw JuiceMakerError.notEnoughBananaStock
        }
        store.fruits["mango"] = strawberryStock - 2
        store.fruits["kiwi"] = bananaStock - 1
    }
}
