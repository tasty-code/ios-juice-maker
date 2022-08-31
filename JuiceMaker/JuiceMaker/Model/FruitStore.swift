//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
        
        var name: String {
            switch self {
            case .strawberry:
                return "딸기"
            case .banana:
                return "바나나"
            case .pineapple:
                return "파인애플"
            case .kiwi:
                return "키위"
            case .mango:
                return "망고"
            }
        }
    }
    let stocks = Fruit.allCases
    
    func increase(change: Int = 0) {
        for stock in stocks {
            if stock == .strawberry {
                strawberry += change
            } else if stock == .banana {
                banana += change
            } else if stock == .pineapple {
                pineapple += change
            } else if stock == .kiwi {
                kiwi += change
            } else if stock == .mango {
                mango += change
            }
        }
    }

    func decrease(change: Int = 0) {
        for stock in stocks {
            if stock == .strawberry {
                strawberry -= change
            } else if stock == .banana {
                banana -= change
            } else if stock == .pineapple {
                pineapple -= change
            } else if stock == .kiwi {
                kiwi -= change
            } else if stock == .mango {
                mango -= change
            }
        }
    }
}

