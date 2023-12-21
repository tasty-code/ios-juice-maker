//
//  JuiceMakerResultDisplayable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

import Foundation

protocol JuiceMakerResultDisplayable: NSObjectProtocol {
    func displayMakingResult(viewModel: JuiceMakerModel.ViewModel)
}

protocol StockDisplayResultDisplayable: NSObjectProtocol {
    func displayStock(viewModel: StockDisplayModel.ViewModel)
}
