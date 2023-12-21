//
//  StockManager.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

final class StockManager {
    private let fruitStore: FruitStore
    
    var resultConverter: StockManagerResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func updateStock(of fruit: Fruit, to newCount: Int) {
        do {
            let updatedStock = try fruitStore.updateStock(of: fruit, to: newCount)
            let result = StockManagerModel.Result(stock: updatedStock)
            resultConverter?.convertResult(result)
        } catch {
            let result = StockManagerModel.Result(stock: nil)
            resultConverter?.convertResult(result)
        }
    }
}
