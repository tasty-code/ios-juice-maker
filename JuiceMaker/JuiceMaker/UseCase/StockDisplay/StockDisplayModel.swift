//
//  StockDisplayModel.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

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
