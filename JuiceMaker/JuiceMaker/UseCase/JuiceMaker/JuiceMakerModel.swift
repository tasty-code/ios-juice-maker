//
//  JuiceMakerModel.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

enum JuiceMakerModel {
    enum Response {
        case success(SuccessInfo)
        case failure(JuiceMakerError)
        
        struct SuccessInfo {
            let juice: JuiceFlavor
            let updatedStocks: [FruitStock]
        }
    }
    
    enum ViewModel {
        struct SuccessInfo {
            let juiceName: String
            let updatedStocks: [(Fruit, Int)]
        }
        
        case sucess(SuccessInfo)
        case failure
    }
}

enum StockDisplayModel {
    enum Response {
        case success([FruitStock])
//        case failure
    }
    
    enum ViewModel {
        struct EachFruitCount {
            let strawberryCount: Int
            let bananaCount: Int
            let pineappleCount: Int
            let kiwiCount: Int
            let mangoCount: Int
        }
        
        case success(EachFruitCount)
        case failure
    }
}
