//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage = FruitStore()

    func getOrder(_ order: Juice) -> [Int?] {
        var makable: [Int?] = []
        do {
            let currentFruitStock: [Int] = try fruitStorage.getStockInfo(order.recipe.fruitName)
            currentFruitStock.enumerated().forEach { stock in
                makable.append(stock.element >= order.recipe.consumption[stock.offset] ? order.recipe.consumption[stock.offset] : nil)
            }
            if try fruitStorage.makeJuice(order.recipe.fruitName, makable) {
                print(order.description)
            }
        } catch {
            print(error)
        }
        return makable
    }
}

enum Juice: CustomStringConvertible {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    
    var recipe: Consumption {
        switch self {
        case .strawberryJuice:
            return Consumption(fruitName: [.strawberry], consumption: [16])
        case .bananaJuice:
            return Consumption(fruitName: [.banana], consumption: [2])
        case .pineappleJuice:
            return Consumption(fruitName: [.pineapple], consumption: [2])
        case .kiwiJuice:
            return Consumption(fruitName: [.kiwi], consumption: [3])
        case .mangoJuice:
            return Consumption(fruitName: [.mango], consumption: [3])
        case .strawberryBananaJuice:
            return Consumption(fruitName: [.strawberry, .banana], consumption: [10, 1])
        case .mangoKiwiJuice:
            return Consumption(fruitName: [.mango, .kiwi], consumption: [2, 1])
        }
    }
    
    var description: String {
            switch self {
            case .strawberryJuice:
                return "주문성공😀 주문하신 딸기쥬스 나왔습니다."
            case .bananaJuice:
                return "주문성공😀 주문하신 바나나쥬스 나왔습니다."
            case .kiwiJuice:
                return "주문성공😀 주문하신 키위쥬스 나왔습니다."
            case .pineappleJuice:
                return "주문성공😀 주문하신 파인애플쥬스 나왔습니다."
            case .mangoJuice:
                return "주문성공😀 주문하신 망고쥬스 나왔습니다."
            case .strawberryBananaJuice:
                return "주문성공😀 주문하신 딸바쥬스 나왔습니다."
            case .mangoKiwiJuice:
                return "주문성공😀 주문하신 망키쥬스 나왔습니다."
            }
        }
    
    struct Consumption {
        let fruitName: [FruitStore.Fruit]
        let consumption: [Int]
    }
}


