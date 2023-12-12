//
//  StockDisplayModel.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

enum StockDisplayModel {
    struct Result {
        let stocks: [FruitStock]?
    }
    
    struct ViewModel {
        struct EachFruitCount {
            let strawberryCount: Int
            let bananaCount: Int
            let pineappleCount: Int
            let kiwiCount: Int
            let mangoCount: Int
        }
        
        let eachFruitCount: EachFruitCount?
    }
}
