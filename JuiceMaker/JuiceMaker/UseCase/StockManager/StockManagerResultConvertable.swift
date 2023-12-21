//
//  StockManagerResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

protocol StockManagerResultConvertable {
    func convertResult(_ response: StockManagerModel.Response)
}

final class StockManagerResultConverter: StockManagerResultConvertable {
    weak var display: (StockManagerResultDisplayable & StockDisplayResultDisplayable)?
    
    func convertResult(_ response: StockManagerModel.Response) {
        switch response {
        case .success(let stock):
            let viewModel = StockManagerModel.ViewModel.success(stock: stock)
            display?.displayModifiedStock(viewModel: viewModel)
        case .failure:
            let viewModel = StockManagerModel.ViewModel.failure
            display?.displayModifiedStock(viewModel: viewModel)
        }
    }
}

extension StockManagerResultConverter: StockDisplayResultConvertable {
    func convertResult(_ result: StockDisplayModel.Response) {
        switch result {
        case .success(let stocks):
            guard let strawberryStock = stocks.first(where: { stock in stock.fruitType == .strawberry }),
                  let bananaStock = stocks.first(where: { stock in stock.fruitType == .banana }),
                  let pineappleStock = stocks.first(where: { stock in stock.fruitType == .pineapple }),
                  let kiwiStock = stocks.first(where: { stock in stock.fruitType == .kiwi }),
                  let mangoStock = stocks.first(where: { stock in stock.fruitType == .mango }) else {
                let viewModel = StockDisplayModel.ViewModel.failure
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
            let viewModel = StockDisplayModel.ViewModel.success(eachFruitCount)
            display?.displayStock(viewModel: viewModel)
        }
    }
}
