//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

final class JuiceMaker {
    private let fruitStore: FruitStore
    
    var resultConverter: JuiceMakerResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func produceJuice(flavor: JuiceFlavor) {
        do {
            let updatedStocks = try consumeFruitsForMakingJuice(flavor: flavor)
            let result = JuiceMakerModel.Response.SuccessInfo(juice: flavor, updatedStocks: updatedStocks)
            let response = JuiceMakerModel.Response(result: result)
            resultConverter?.convertResult(response)
        } catch {
            let result = JuiceMakerModel.Response(result: nil)
            resultConverter?.convertResult(result)
        }
    }
    
    private func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws -> [FruitStock] {
        return try fruitStore.consume(ingredients: flavor.recipe)
    }
}
