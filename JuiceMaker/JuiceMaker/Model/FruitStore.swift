//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

// 과일 저장소 타입
final class FruitStore {
    static let shared: FruitStore = FruitStore()
    
    private init() {}
    
    var fruitList: [FruitInfo] = [
        FruitInfo(name: .strawberry, quantity: 0),
        FruitInfo(name: .banana, quantity: 0),
        FruitInfo(name: .pineapple, quantity: 0),
        FruitInfo(name: .kiwi, quantity: 0),
        FruitInfo(name: .mango, quantity: 0)
    ]
    
    public func addFruitQuantity(fruit: Fruit) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity += 1
        }
    }
    
    public func deleteFruitQuantity(fruit: Fruit) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity -= 1
        }
    }
    
    public func showFruitQuantity(fruit: Fruit) -> String {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            return String(fruitList[index].quantity)
        }
        return String(0)
    }
    
    public func checkFruitsQuantity(fruit: Fruit, willUseQuantity: Int) -> Bool {
        let result = fruitList
            .firstIndex { $0.name == fruit }
            .map { fruitList[$0].quantity >= willUseQuantity } ?? false
        return result
    }
    
    public func usedFruitsQuantity(fruit: Fruit, usedQuantity: Int) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity -= usedQuantity
        }
    }
    
    //a\ 과일 재고 확인
    // 1. 고ㅏ일 종류
    func checkFruit(fruit: Fruit) -> Int {
        // fruit의 갯수 확인 함수 호출  6개 Int
        // 1. 과일 어디에 저장되어 있는가
        // 2. 저장된 곳에서 이 과일은 어디에 있는가
        // 2. 저장된 곳에서 갯수를 확인 한다
        // 3. 확인하나 갯수를 리턴한다.
        return fruitList.map {$0.name == fruit}.count
    }
    

}

