//
//  StockDisplay.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

final class StockDisplay {
    private let fruitStore: FruitStore
    
    var resultConverter: StockDisplayResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func displayStock() {
        let stocks = fruitStore.fetchStocks()
        let result = StockDisplayModel.Response(stocks: stocks)
        resultConverter?.convertResult(result)
    }
}
