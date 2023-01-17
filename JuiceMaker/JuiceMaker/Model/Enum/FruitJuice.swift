//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/03.
//

enum FruitJuice: Makable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case ddalbaJuice
    case mangoJuice
    case mangkiJuice
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .ddalbaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangkiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

//MARK: - 문자열 표현
extension FruitJuice: CustomStringConvertible {
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .ddalbaJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangkiJuice:
            return "망키쥬스"
        }
    }
}
