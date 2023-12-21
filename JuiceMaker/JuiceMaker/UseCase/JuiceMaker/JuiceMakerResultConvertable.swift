//
//  JuiceMakerResultConvertable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

protocol JuiceMakerResultConvertable {
    func convertResult(_ response: JuiceMakerModel.Response)
}

final class JuiceMakerResultConverter: JuiceMakerResultConvertable {
    weak var display: JuiceMakerResultDisplayable?
    
    func convertResult(_ response: JuiceMakerModel.Response) {
        guard let response = response.result else {
            let viewModel = JuiceMakerModel.ViewModel(successInfo: nil)
            display?.displayMakingResult(viewModel: viewModel)
            return
        }
        
        let fruitStocks = response.updatedStocks.map { stock in
            return (stock.fruitType, stock.count)
        }
        let info = JuiceMakerModel.ViewModel.SuccessInfo(
            juiceName: response.juice.name,
            updatedStocks: fruitStocks
        )
        let viewModel = JuiceMakerModel.ViewModel(successInfo: info)
        display?.displayMakingResult(viewModel: viewModel)
    }
}
