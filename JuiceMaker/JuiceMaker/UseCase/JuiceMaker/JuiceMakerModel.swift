//
//  JuiceMakerModel.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

enum JuiceMakerModel {
    struct Response {
        struct SuccessInfo {
            let juice: JuiceFlavor
            let updatedStocks: [FruitStock]
        }
        let result: SuccessInfo?
    }
    
    struct ViewModel {
        struct SuccessInfo {
            let juiceName: String
            let updatedStocks: [(Fruit, Int)]
        }
        let successInfo: SuccessInfo?
    }
}
