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
    weak var display: StockManagerResultDisplayable?
    
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
