//
//  JuiceMakerResultConvertable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

protocol JuiceMakerResultConvertable {
    func convertResult(_ result: JuiceMakerModel.Response)
}

final class JuiceMakerResultConverter: JuiceMakerResultConvertable {
    weak var display: JuiceMakerResultDisplayable?
    
    func convertResult(_ result: JuiceMakerModel.Response) {
        guard let juice = result.juice else {
            let viewModel = JuiceMakerModel.ViewModel(juiceName: nil)
            display?.displayMakingResult(viewModel: viewModel)
            return
        }
        let viewModel = JuiceMakerModel.ViewModel(juiceName: juice.name)
        display?.displayMakingResult(viewModel: viewModel)
    }
}
