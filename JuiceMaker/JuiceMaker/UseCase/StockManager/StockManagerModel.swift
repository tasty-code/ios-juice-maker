//
//  StockManagerModel.swift
//  JuiceMaker
//
//  Created by Effie on 12/21/23.
//

enum StockManagerModel {
    enum Response {
        case success(stock: FruitStock)
        case failure
    }
    
    enum ViewModel {
        case success(stock: FruitStock)
        case failure
    }
}
