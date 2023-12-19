//
//  StockDisplayResultConvertable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

protocol StockDisplayResultConvertable {
    func convertResult(_ result: StockDisplayModel.Response)
}

final class StockDisplayResultConverter: StockDisplayResultConvertable {
    weak var display: StockDisplayResultDisplayable?
    
    func convertResult(_ result: StockDisplayModel.Response) {
        guard let stocks = result.stocks else {
            let viewModel = StockDisplayModel.ViewModel(countOfEachFruits: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        
        guard let strawberryStock = stocks.first(where: { stock in stock.fruitType == .strawberry }),
              let bananaStock = stocks.first(where: { stock in stock.fruitType == .banana }),
              let pineappleStock = stocks.first(where: { stock in stock.fruitType == .pineapple }),
              let kiwiStock = stocks.first(where: { stock in stock.fruitType == .kiwi }),
              let mangoStock = stocks.first(where: { stock in stock.fruitType == .mango }) else {
            let viewModel = StockDisplayModel.ViewModel(countOfEachFruits: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        
        let eachFruitCount = StockDisplayModel.ViewModel.EachFruitCount(
            strawberryCount: strawberryStock.count,
            bananaCount: bananaStock.count,
            pineappleCount: pineappleStock.count,
            kiwiCount: kiwiStock.count,
            mangoCount: mangoStock.count
        )
        let viewModel = StockDisplayModel.ViewModel(countOfEachFruits: eachFruitCount)
        display?.displayStock(viewModel: viewModel)
    }
}
