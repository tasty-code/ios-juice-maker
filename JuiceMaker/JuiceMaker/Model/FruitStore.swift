//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum InventoryError : Error {
            static let outOfStockMessage = "재료 없음. 재고를 수정할까요?"
            static let fruitThatDoesNotExistMessage  = "그런 과일 없음"
        
            case inventoryError(description: String)
        }
    
    // ⭐️⭐️⭐️⭐️⭐️
    // reduce -> '시퀀스의 각 요소'에 대해 제공된 클로저를 사용하여 값을 결합 reduce(초기값) 여기에서는 빈 딕셔너리임 ([Fruit: Int]())
    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag // 클로저 내에서 값을 직접 변경할 수 없기 때문에 새로운 변수에 값을 할당
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits // 현재 순회 중인 과일에 대한 재고를 딕셔너리에 추가합니다.
        return bag // 없데이트된 딕셔너리를 반환 -> reduce 함수는 이 반환값을 다음 순회에 사용하여 값을 누적합니다. -> inventory 프로퍼티에 할당되어 해당 과일의 초기 재고를 나타내게 됩니다.
    }

    // 과일의 수량 n개를 변경하는 함수
    func changeAmount(_ fruit: Fruit, _ number: Int) {
        inventory[fruit] = number
    }
    
    // 재고 증가 함수
    func increaseStock() {
        
    }
    
    // 재고 감소 함수
    func decreaseStock() {
        
    }
    
    // 재료 사용 함수 useIngredients
    func useIngredients() {
        decreaseStock()
    }
    
    // 재고 체킹 함수 checkStock
    // amountOfFruitNow: 현재 과일의 수   amountRequired: 필요한 과일의 수
    func checkStock(amountOfFruitNow: Int, amountRequired: Int) throws {
        guard amountOfFruitNow > amountRequired else {
            throw InventoryError.inventoryError(description: InventoryError.outOfStockMessage)
        }
    }
    
    //
    func giveBackNumberIfExist(_ fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryError.inventoryError(description: InventoryError.fruitThatDoesNotExistMessage)
        }
        return numberOfFruitExist
    }
    
    // 재료 체킹 함수 checkIngredients
    func checkIngredients(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try giveBackNumberIfExist(demand.requiredFruit)
            try checkStock(amountOfFruitNow: numberOfFruit, amountRequired: demand.requestedAmount)
            numberOfFruitExist.append(numberOfFruit)
        }

        return numberOfFruitExist
    }
    
    // 주스 produce 성공시 재고 소비, 에러뜨면 catch문으로
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        // 필요한 재료의 수량 체크해서 과일 몇개인지
        let amountOfFruit = try checkIngredients(recipes)
        
        useIngredients()
    }
    
}

// 만들기    -> / 재고 소비       ->      재료 체크     (재고 체크)     -> 재료 사용        -> 재고 감소
// JuiceMaker /    FruitStore
// produce -> / consumeStocks -> checkIngredients (checkStock) -> useIngredients -> decreaseStock
