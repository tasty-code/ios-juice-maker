//
//  StockManagerResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

protocol StockManagerResultConvertable {
    func convertResult(_ result: StockManagerModel.Result)
}

final class StockManagerResultConverter: StockManagerResultConvertable {
    weak var display: StockManagerResultDisplayable?
    
    func convertResult(_ result: StockManagerModel.Result) {
        let viewModel = StockManagerModel.ViewModel(stock: result.stock)
        display?.displayModifiedStock(viewModel: viewModel)
    }
}
