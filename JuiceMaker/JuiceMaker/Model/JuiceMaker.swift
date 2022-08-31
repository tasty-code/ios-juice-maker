//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
        
        var name: String {
            switch self {
            case .strawberry:
                return "딸기쥬스"
            case .banana:
                return "바나나쥬스"
            case .kiwi:
                return "키위쥬스"
            case .pineapple:
                return "파인애플쥬스"
            case .strawberryBanana:
                return "딸바쥬스"
            case .mango:
                return "망고쥬스"
            case .mangoKiwi:
                return "망고키위쥬스"
            }
        }
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case .kiwi:
                return [.kiwi: 3]
            case .pineapple:
                return [.pineapple: 2]
            case .strawberryBanana:
                return [.strawberry: 10, .banana: 1]
            case .mango:
                return [.mango: 3]
            case .mangoKiwi:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    let fruitStore = FruitStore()
    
    func makeJuice(to menu: Juice) {
        if isMakeAble(juice: menu) == false {
            return
        }
        
        useIngredients(of: menu)
    }
    
    private func isMakeAble(juice: Juice) -> Bool {
        for ingredients in juice.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            
            if fruitStore.getAmount(of: demandFruitType) < ingredients.value {
                notShowMenuAlert(of: juice)
                return false
            }
        }
        
        showMenuAlert(of: juice)
        return true
    }
    
    private func useIngredients(of menu: Juice) {
        for ingredients in menu.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            fruitStore.decrease(of: demandFruitType, to: ingredients.value)
        }
    }
    
    private func showMenuAlert(of juice: Juice) {
        let alert = UIAlertController(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        viewController.present(alert, animated: true)
    }
    
    private func notShowMenuAlert(of juice: Juice) {
        let alert = UIAlertController(title:"재료가 모자라요. 재고를 수정할까요?",message: "",preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: {
            action in
            guard let nextVC = viewController.storyboard?.instantiateViewController(identifier: "ingredientCheangedView") else {return}
             viewController.present(nextVC, animated: true)
            
        })
        
        let cancle = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(cancle)
        alert.addAction(ok)
        viewController.present(alert,animated: true,completion: nil)
        
    }
}
