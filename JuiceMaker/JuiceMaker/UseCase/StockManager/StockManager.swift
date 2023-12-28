//
//  StockManager.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

final class StockManager {
    private let fruitStore: FruitStore
    
    var resultConverter: (StockManagerResultConvertable & StockDisplayResultConvertable)?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func updateStock(of fruit: Fruit, to newCount: Int) {
        do {
            let updatedStock = try fruitStore.updateStock(of: fruit, to: newCount)
            let result = StockManagerModel.Response.success(stock: updatedStock)
            resultConverter?.convertResult(result)
        } catch {
            let result = StockManagerModel.Response.failure
            resultConverter?.convertResult(result)
        }
    }
}

extension StockManager {
    func displayStock() {
        let stocks = fruitStore.fetchStocks()
        let result = StockDisplayModel.Response.success(stocks)
        resultConverter?.convertResult(result)
    }
}
