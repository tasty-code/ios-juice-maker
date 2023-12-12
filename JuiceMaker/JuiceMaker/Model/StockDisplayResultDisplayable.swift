//
//  StockDisplayResultDisplayable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

import Foundation

protocol StockDisplayResultDisplayable: NSObjectProtocol {
    func displayStock(viewModel: StockDisplayModel.ViewModel)
}
