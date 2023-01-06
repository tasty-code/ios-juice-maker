//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        juiceManagerSingleTest()
        juiceManagerMixTest()
    }
    
    func juiceManagerSingleTest() {
        let calculator = Calculator()
        let juiceMaker = JuiceMaker(calculator: calculator)
        
        print("🅰️ Single Juice Test❗️")
        print("초기 재고 수량입니다!")
        print(juiceMaker.fruitStore.store.values)
        juiceMaker.fruitStore.changeStock(fruit: .strawberry, number: 16)
        juiceMaker.fruitStore.changeStock(fruit: .banana, number: 2)
        juiceMaker.fruitStore.changeStock(fruit: .kiwi, number: 3)
        juiceMaker.fruitStore.changeStock(fruit: .pineApple, number: 2)
        juiceMaker.fruitStore.changeStock(fruit: .mango, number: 3)
        print("재고 수량을 입력했을 경우 아래의 재고를 보여줍니다.")
        print(juiceMaker.fruitStore.store.values)
        
        juiceMaker.requestTo(single: .strawberry)
        juiceMaker.requestTo(single: .banana)
        juiceMaker.requestTo(single: .kiwi)
        juiceMaker.requestTo(single: .pineApple)
        juiceMaker.requestTo(single: .mango)
        print("1️⃣ 한 가지 종류의 쥬스를 만들고 남은 재고 수량입니다!")
        print(juiceMaker.fruitStore.store.values)
        
        print("2️⃣ 재고가 없어도 쥬스를 만들수 있는지 확인하는 구문입니다!")
        juiceMaker.requestTo(single: .strawberry)
        juiceMaker.requestTo(single: .banana)
        juiceMaker.requestTo(single: .kiwi)
        juiceMaker.requestTo(single: .pineApple)
        juiceMaker.requestTo(single: .mango)
        print(juiceMaker.fruitStore.store.values)
        print("\n")
    }
    
    func juiceManagerMixTest() {
        let calculator = Calculator()
        let juiceMaker = JuiceMaker(calculator: calculator)
        
        print("🅱️ Mix Juice Test❗️")
        juiceMaker.fruitStore.changeStock(fruit: .strawberry, number: 10)
        juiceMaker.fruitStore.changeStock(fruit: .banana, number: 10)
        juiceMaker.fruitStore.changeStock(fruit: .kiwi, number: 10)
        juiceMaker.fruitStore.changeStock(fruit: .pineApple, number: 10)
        juiceMaker.fruitStore.changeStock(fruit: .mango, number: 10)
        
        print("초기 재고 수량입니다!")
        print(juiceMaker.fruitStore.store.values)
        juiceMaker.requestTo(mix: .strawberryAndBanana)
        
        print("딸바 쥬스를 만들고 난 뒤의 재고입니다.")
        print(juiceMaker.fruitStore.store.values)
        
        juiceMaker.requestTo(mix: .mangoAndKiwi)
        print("3️⃣ 두 가지 종류의 쥬스를 만들고 남은 재고 수량입니다!")
        print(juiceMaker.fruitStore.store.values)
    }
}

