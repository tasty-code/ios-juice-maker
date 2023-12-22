//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

final class JuiceMaker {
    private let fruitStore: FruitStore
    
    var resultConverter: (JuiceMakerResultConvertable & StockDisplayResultConvertable)?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func produceJuice(flavor: JuiceFlavor) {
        do {
            let updatedStocks = try consumeFruitsForMakingJuice(flavor: flavor)
            let successInfo = JuiceMakerModel.Response.SuccessInfo(juice: flavor, updatedStocks: updatedStocks)
            let response = JuiceMakerModel.Response.success(successInfo)
            resultConverter?.convertResult(response)
        } catch {
            if let error = error as? JuiceMakerError {
                let response = JuiceMakerModel.Response.failure(error)
                resultConverter?.convertResult(response)
            }
        }
    }
    
    private func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws -> [FruitStock] {
        return try fruitStore.consume(ingredients: flavor.recipe)
    }
}

extension JuiceMaker {
    func displayStock() {
        let stocks = fruitStore.fetchStocks()
        let result = StockDisplayModel.Response.success(stocks)
        resultConverter?.convertResult(result)
    }
}
