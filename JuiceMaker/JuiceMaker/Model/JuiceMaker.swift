//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum JuiceMenu: String, CustomStringConvertible {
        // CustomStringConvertible -> 사용자 지정된 문자열 표현을 제공할 수 있도록 하는 기능을 제공합니다.
        // description이라는 속성을 구현해야 합니다. 이 속성은 '해당 타입의 인스턴스'를 '문자열'로 나타내는 데 사용됩니다.
        case strawberry = "딸기 쥬스"
        case banana = "바나나 쥬스"
        case pineapple = "파인애플 쥬스"
        case kiwi = "키위 쥬스"
        case mango = "망고 쥬스"
        case strawberryBanana = "딸바 쥬스"
        case mangoKiwi = "망키 쥬스"
        
        // JuiceMenu 열거형의 '각 케이스'를 '문자열'로 표현하기 위한 사용자 정의된 표현을 제공하는 부분입니다.
        var description: String {
            self.rawValue
        }
        
        // 쥬스 레시피 받는 함수
        fileprivate func receiveRecipes() -> [(requiredFruit: Fruit, requestedAmount: Int)] {
            var recipe: [(Fruit, Int)]
            
            switch self {
            case .strawberry:
                recipe = [(.strawberry, 16)]
            case .banana:
                recipe = [(.banana, 2)]
            case .kiwi:
                recipe = [(.kiwi, 3)]
            case .pineapple:
                recipe = [(.pineapple, 2)]
            case .mango:
                recipe = [(.mango, 3)]
            case .strawberryBanana:
                recipe = [(.strawberry, 10), (.banana, 1)]
            case .mangoKiwi:
                recipe = [(.mango, 2), (.kiwi, 1)]
            }
            return recipe
        }
    }
    
    // 주스메이킹 결과
    enum JuiceMakingResult {
        case success(message: String)
        case failure(description: String)
    }
    
    // JuiceMaker는 FruitStore를 소유
    let fruitStore: FruitStore
    
    // 주스 제조
    func produce(_ menuName: JuiceMenu) -> JuiceMakingResult {
        let recipes = menuName.receiveRecipes()
        var outcomeCreated: JuiceMakingResult // 메이킹 결과 <성공/실패>
        
        do {
            
        } catch  {
            
        }
        return outcomeCreated
    }
    
}

