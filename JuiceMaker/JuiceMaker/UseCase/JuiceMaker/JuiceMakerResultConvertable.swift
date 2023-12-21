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
        switch response {
        case .success(let info):
            let fruitStocks = info.updatedStocks.map { stock in
                return (stock.fruitType, stock.count)
            }
            let successInfo = JuiceMakerModel.ViewModel.SuccessInfo(
                juiceName: info.juice.name,
                updatedStocks: fruitStocks
            )
            let viewModel = JuiceMakerModel.ViewModel.sucess(successInfo)
            display?.displayMakingResult(viewModel: viewModel)
        case .failure(let error):
            let viewModel = JuiceMakerModel.ViewModel.failure
            display?.displayMakingResult(viewModel: viewModel)
        }
    }
}
