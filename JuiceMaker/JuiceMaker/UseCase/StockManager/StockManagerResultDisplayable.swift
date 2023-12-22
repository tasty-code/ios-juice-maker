//
//  StockManagerResultDisplayable.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

import Foundation

protocol StockManagerResultDisplayable: NSObjectProtocol {
    func displayModifiedStock(viewModel: StockManagerModel.ViewModel)
}
